from flask import Flask, render_template, request, redirect, url_for, flash, Response, session, jsonify
import mysql.connector
import cv2
import os
import face_recognition
from flask import send_from_directory
import numpy as np
from datetime import datetime
from werkzeug.utils import secure_filename
import base64
from flask_socketio import SocketIO

# Initialize Flask app
app = Flask(__name__)
app.secret_key = "supersecretkey"
socketio = SocketIO(app)

UPLOAD_FOLDER = "static/employees"
VISITOR_FOLDER = "static/visitors"
os.makedirs(UPLOAD_FOLDER, exist_ok=True)
os.makedirs(VISITOR_FOLDER, exist_ok=True)

# Database connection function
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="775533",  # Update with your MySQL password
        database="face_recognition"
    )

# Load known faces from database
known_face_encodings = []
known_face_names = []
known_face_ids = []

def load_known_faces():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT id, name, face_vector FROM employees")  
    employees = cursor.fetchall()

    encodings, names, ids = [], [], []
    for emp_id, name, encoding in employees:
        encoding_array = np.frombuffer(encoding, dtype=np.float64)
        encodings.append(encoding_array)
        names.append(name)
        ids.append(emp_id)

    cursor.close()
    conn.close()
    return encodings, names, ids

known_face_encodings, known_face_names, known_face_ids = load_known_faces()

camera = cv2.VideoCapture(0)
last_recognized = {}

def generate_frames():
    while True:
        success, frame = camera.read()
        if not success:
            break

        rgb_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        face_locations = face_recognition.face_locations(rgb_frame)
        face_encodings = face_recognition.face_encodings(rgb_frame, face_locations)

        for face_encoding, (top, right, bottom, left) in zip(face_encodings, face_locations):
            matches = face_recognition.compare_faces(known_face_encodings, face_encoding, tolerance=0.6)
            face_distances = face_recognition.face_distance(known_face_encodings, face_encoding)
            
            name = "Unknown"
            emp_id = None

            if len(face_distances) > 0:
                best_match_index = np.argmin(face_distances)
                if matches[best_match_index]:
                    if best_match_index < len(known_face_names):
                        name = known_face_names[best_match_index]
                        emp_id = known_face_ids[best_match_index]

                        if emp_id not in last_recognized or (datetime.now() - last_recognized[emp_id]).seconds > 30:
                            last_recognized[emp_id] = datetime.now()
                            entry_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

                            conn = get_db_connection()
                            cursor = conn.cursor()
                            cursor.execute("INSERT INTO attendance (emp_id, name, entry_time) VALUES (%s, %s, %s)", 
                                           (emp_id, name, entry_time))
                            conn.commit()
                            cursor.close()
                            conn.close()

                            # Emit real-time update to frontend
                            socketio.emit("employee_recognized", {"name": name, "entry_time": entry_time})


            cv2.rectangle(frame, (left, top), (right, bottom), (0, 255, 0), 2)
            cv2.putText(frame, name, (left, top - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)

        _, buffer = cv2.imencode('.jpg', frame)
        frame_bytes = buffer.tobytes()
        yield (b'--frame\r\nContent-Type: image/jpeg\r\n\r\n' + frame_bytes + b'\r\n')

@app.route('/video_feed')
def video_feed():
    return Response(generate_frames(), mimetype='multipart/x-mixed-replace; boundary=frame')

@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'), 'favicon.ico', mimetype='image/vnd.microsoft.icon')


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login_A')
def login_A():
    return render_template('login_A.html')

@app.route('/login_R')
def login_R():
    return render_template('login_R.html')

@app.route('/login_register', methods=['POST'])
def login_register():
    password = request.form.get('password')
    if password == "123456":
        session['admin_logged_in'] = True
        flash("Welcome, Admin!", "success")
        return redirect('/register')
    else:
        flash("Invalid credentials!", "danger")
        return redirect('/login_R')

@app.route('/login_attendance', methods=['POST'])
def login_attendance():
    password = request.form.get('password')
    if password == "123456":
        session['admin_logged_in'] = True
        flash("Welcome, Admin!", "success")
        return redirect('/attendance')
    else:
        flash("Invalid credentials!", "danger")
        return redirect('/login_A')

@app.route('/attendance')
def attendance():
    return render_template('attendance.html')

@app.route('/get_attendance', methods=['GET'])
def get_attendance():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT name, entry_time FROM attendance ORDER BY entry_time DESC")
        attendance = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify({"attendance": attendance})
    except Exception as e:
        return jsonify({"message": "Error fetching attendance data", "error": str(e)}), 500

@app.route('/register')
def register():
    return render_template('register.html')

@app.route('/register_employee', methods=['POST'])
def register_employee():
    try:
        name = request.form['name']
        file = request.files['image']

        if not name or not file:
            return jsonify({'message': 'Name and image are required'}), 400

        image_path = os.path.join(UPLOAD_FOLDER, file.filename)
        file.save(image_path)

        image = face_recognition.load_image_file(image_path)
        encodings = face_recognition.face_encodings(image)

        if len(encodings) == 0:
            os.remove(image_path)
            return jsonify({'message': 'No face found in the image'}), 400

        face_encoding = encodings[0].tobytes()

        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO employees (name, face_vector) VALUES (%s, %s)", (name, face_encoding))
        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({'message': 'Employee Registered Successfully', 'name': name})
    except Exception as e:
        return jsonify({'message': 'Error registering face', 'error': str(e)}), 500

@app.route('/capture', methods=['POST'])
def capture_image():
    success, frame = camera.read()
    if success:
        save_path = "static/employees"
        os.makedirs(save_path, exist_ok=True)
        image_path = os.path.join(save_path, "emp.jpg")

        cv2.imwrite(image_path, frame)
        _, buffer = cv2.imencode(".jpg", frame)
        encoded_image = base64.b64encode(buffer).decode("utf-8")

        return jsonify({"message": "Image captured successfully!", "image_path": image_path, "encoded_image": encoded_image})

    return jsonify({"message": "Failed to capture image"}), 500

@app.route('/enter_visitor', methods=['POST'])
def enter_visitor():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO attendance (emp_id, name, entry_time) VALUES (NULL, 'Visitor', NOW())")
        conn.commit()
        cursor.close()
        conn.close()

        socketio.emit('new_visitor', {"message": "A new visitor entry has been recorded!"})
        flash("Visitor entry recorded successfully!", "success")
    except Exception as e:
        flash(f"Database error: {str(e)}", "danger")

    return redirect(url_for('index'))

if __name__ == '__main__':
    socketio.run(app, debug=True)

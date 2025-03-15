# Face Recognition System for Cosmos Air Pvt Ltd

This document describes the Face Recognition System (FRS) developed for Cosmos Air Pvt Ltd. The FRS is a comprehensive web-based solution designed to manage employee and visitor entry, track attendance, and provide administrative access to employee data and entry logs.

## Table of Contents

*   [Overview](#overview)
*   [Technical Stack](#technical-stack)
*   [Core Features](#core-features)
*   [Face Recognition Process](#face-recognition-process)
*   [Employee Registration Process](#employee-registration-process)
*   [Security Features](#security-features)
*   [Future Enhancement Possibilities](#future-enhancement-possibilities)
*   [Technical Dependencies](#technical-dependencies)
*   [Maintenance Requirements](#maintenance-requirements)
*   [User Access and Instructions](#user-access-and-instructions)

## Overview

The FRS streamlines employee entry through facial recognition, automatically marking attendance and storing the data in a MySQL database. It also handles visitor entries, recording them as “Visitor entry” in the database. The system maintains entry logs and allows authorized administrators to add employees to the recognition database and access attendance records.

## Technical Stack

*   **Frontend:** HTML, CSS, JavaScript
*   **Backend:** Python
*   **Database:** MySQL
*   **Special Hardware:** Webcam

## Core Features

1. **Main Interface**
    *   Live Webcam Feed display
    *   Real-time Face Recognition processing
    *   Display of Employee Information when registered:
        *   Employee Photograph
        *   Employee Name
        *   Employee ID
    *   Three primary action buttons prominently displayed:
        *   Register New Employee
        *   Enter as Visitor
        *   View Entry Logs
     
   ![FRS Home](https://github.com/user-attachments/assets/20a61d01-69b4-4b01-a226-da14e35d87b9)


## Face Recognition Process

1.  System captures Live Video feed from the webcam.
2.  Processes each frame for face detection.
3.  Compares detected face with the registered employee database.
4.  On match:
    *   Displays that the entry was marked.  ![FRS Entry Marked](https://github.com/user-attachments/assets/105c39fc-924b-49b5-9aba-d64ed50d2929)

    *   Logs entry in the database.  ![FRS Admin Attendance 1](https://github.com/user-attachments/assets/b5e3394e-f51c-47cb-999c-c426603250b7)

5.  On no match:
    *   Prompts for visitor entry or registration of employee.

## Employee Registration Process

1.  System requests Admin authentication.
2.  If correct admin ID is entered, the employee registration form is displayed.
3.  Data collection:
    *   Employee name entry.
    *   Live Photo capture via the webcam.
    *   Unique employee ID generation via random number generator.
4.  New employee’s data gets updated in the MySQL Database.
5.  Return to the main interface.

## View Attendance Process

1.  System requests Admin authentication.
2.  If correct admin ID is entered, the entry log is displayed.

## Security Features

*   Admin ID protection of sensitive functions.
*   Secure database connections.
*   Protected employee data access.
*   Encrypted data storage. 

## Future Enhancement Possibilities

*   Multi-factor authentication.
*   Mobile application integration.
*   Remote access capabilities.
*   Automated reporting system.
*   Attendance tracking integration.
*   Leave management system.

## Technical Dependencies

*   OpenCV for face recognition.
*   MySQL Connector for Python.
*   Web framework (Flask).
*   JavaScript libraries for animations.
*   CSS framework for responsive design.

## Maintenance Requirements

*   Regular database backups.
*   System log monitoring.
*   Face recognition model updates.
*   Security patches and updates.
*   Hardware maintenance (webcam).

## User Access and Instructions

**Accessing the System:**

The FRS is a web-based application. Access it by navigating to the designated drive link provided.
https://drive.google.com/drive/folders/1RwMTdhzguMi1QpgO9SjEuAf1gnVGpbSd?usp=drive_link

**Using the System:**

**Main Interface:**

1.  Upon accessing the prototype. 
2.  The live webcam feed will be displayed.  ![FRS Home](https://github.com/user-attachments/assets/31e77cb2-e006-4046-8c89-da23ae7713aa)

3.  To register a new employee, click the "Register New Employee" button. You will be prompted for admin authentication.  ![FRS Registration ](https://github.com/user-attachments/assets/e2e72b7e-4391-4dc2-a1a7-8ae5cad5280b)

4.  To enter as a visitor, click the "Enter as Visitor" button and follow the on-screen prompts.
5.  To view entry logs, click the "View Entry Logs" button. You may need admin privileges to access this feature.

**Employee Registration:**

1.  Click "Register New Employee."
2.  Enter the correct Admin ID when prompted.  ![FRS Registration ](https://github.com/user-attachments/assets/72306033-3140-4f20-bf56-e9a2cd829463)


3.  Fill out the employee registration form, including the employee's name.
4.  Capture the employee's photo using the webcam.  ![FRS Registration 1 ](https://github.com/user-attachments/assets/3a3242c3-a773-4b7a-b606-f9317a26e989)

5.  The system will generate a unique Employee ID.  ![FRS Random No](https://github.com/user-attachments/assets/b87e2ffa-abbb-416b-9db1-6be23a0bd070)

6.  The new employee's data will be added to the database.  ![FRS Registered](https://github.com/user-attachments/assets/2707accb-f713-4c99-818c-236fbc62e38e)


**Visitor Entry:**

1.  Click "Enter as Visitor.  "![FRS Home](https://github.com/user-attachments/assets/0b148cf4-6a5a-4cb2-b458-919cf3beae35)
 
2.  Visitor entry will be logged into the database with time logs.  ![FRS Admin Attendance 1](https://github.com/user-attachments/assets/dac6c0a9-0f52-4f4b-a8ca-4930abd25ba8)


**Viewing Entry Logs:**

1.  Click "View Entry Logs."
2.  Enter Admin credentials.  ![FRS Admin Attendance'](https://github.com/user-attachments/assets/04a26754-f7ba-4a26-ace2-b849984f7334)

3.  The system will display the entry logs, including employee/visitor entry times and other relevant information.  ![FRS Admin Attendance 1](https://github.com/user-attachments/assets/9f739809-9af3-4fb0-a6f9-2d27bc65460e)


**Troubleshooting:**

*   **Camera Access:** Ensure that your browser has permission to access your webcam.
*   **Face Recognition Issues:** If the system is not recognizing faces, ensure that the lighting is adequate and that the individual's face is clearly visible. Contact the system administrator if you continue to experience issues.
*   **Login Problems:** If you are having trouble logging in, contact the system administrator.



**[Admin ID for accessing administrative functions: 123456]**

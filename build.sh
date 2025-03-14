#!/usr/bin/env bash
# Exit on error and enable verbose output
set -e
set -x

echo "Starting build process..."

# Install system dependencies
apt-get update
apt-get install -y cmake libsm6 libxext6 libxrender-dev libglib2.0-0 libgl1-mesa-glx

# Create a swap file to increase available memory
dd if=/dev/zero of=/swapfile bs=1M count=2048
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "Swap space created and activated"
free -h

# Install Python dependencies except dlib and face_recognition
pip install --upgrade pip
pip install numpy==1.24.3 pandas==1.5.3 Flask==2.3.3 Werkzeug==2.3.7 
pip install opencv-python-headless==4.8.1.78 Pillow==10.0.1 gunicorn==21.2.0
pip install mysql-connector-python==8.1.0 flask-socketio==5.3.5 python-socketio==5.9.0 python-engineio==4.7.1 eventlet==0.33.3
pip install face-recognition-models==0.3.0

# Install dlib - try pre-built wheel first
echo "Attempting to install pre-built dlib wheel..."
if pip install https://github.com/jloh02/dlib/releases/download/v19.24/dlib-19.24.0-cp311-cp311-linux_x86_64.whl; then
    echo "Successfully installed pre-built dlib wheel"
else
    echo "Pre-built wheel failed, building dlib from source with reduced parallelism"
    # Optimize compiler flags for memory usage
    export CFLAGS="-O2 -g0 -mtune=generic"
    export CXXFLAGS="-O2 -g0 -mtune=generic"
    
    # Install dlib with only 1 worker to reduce memory usage
    pip install dlib==19.24.2 --no-cache-dir --global-option=build_ext --global-option="-j1"
fi

# Verify dlib installation
echo "Verifying dlib installation..."
pip show dlib

# Install face_recognition
echo "Installing face_recognition..."
pip install face-recognition==1.3.0

# Verify face_recognition installation
echo "Verifying face_recognition installation..."
pip show face-recognition

# Run test script to verify imports
echo "Running test script to verify imports..."
python test_imports.py

# Create necessary directories
mkdir -p static/employees
mkdir -p static/visitors

# Print all installed packages for debugging
echo "Installed packages:"
pip list

# Make sure the app.py file is executable
chmod +x app.py

# Clean up swap
swapoff /swapfile
rm /swapfile

echo "Build process completed successfully" 

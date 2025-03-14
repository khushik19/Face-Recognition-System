#!/usr/bin/env bash
# Exit on error
set -o errexit

# Install system dependencies for OpenCV
apt-get update
apt-get install -y libsm6 libxext6 libxrender-dev libglib2.0-0 libgl1-mesa-glx

# Create a swap file to increase available memory
dd if=/dev/zero of=/swapfile bs=1M count=1024
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "Swap space created and activated"

# Install Python dependencies without dlib first
pip install --upgrade pip

# Remove dlib from requirements.txt temporarily
grep -v "dlib" requirements.txt > requirements_nodlib.txt

# Install everything except dlib
pip install -r requirements_nodlib.txt

# Try to install pre-built dlib wheel for Python 3.11
pip install https://github.com/jloh02/dlib/releases/download/v19.24/dlib-19.24.0-cp311-cp311-linux_x86_64.whl || {
  echo "Pre-built wheel failed, trying to build with reduced parallelism"
  # If pre-built wheel fails, try to build with reduced parallelism and memory usage
  export CFLAGS="-O2 -g0 -mtune=generic"
  export CXXFLAGS="-O2 -g0 -mtune=generic"
  # Install dlib with only 1 worker to reduce memory usage
  pip install dlib --no-cache-dir --global-option=build_ext --global-option="-j1"
}

# Install face-recognition after dlib is installed
pip install face-recognition

# Create necessary directories if they don't exist
mkdir -p static/employees
mkdir -p static/visitors

# Print Python and package versions for debugging
python --version
pip list

# Clean up swap
swapoff /swapfile
rm /swapfile 
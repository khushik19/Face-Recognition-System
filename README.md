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

The FRS streamlines employee entry through facial recognition, automatically marking attendance and storing the data in a MySQL database. It also handles visitor entries, recording them as “Visitor entry” in the database. The system maintains entry logs and allows authorized administrators to add or remove employees from the recognition database and access attendance records.

## Technical Stack

*   **Frontend:** HTML, CSS, JavaScript
*   **Backend:** Python
*   **Database:** MySQL
*   **Special Hardware:** Webcam

## Core Features

1.  **Main Interface**
    *   Live Webcam Feed display
    *   Real-time Face Recognition processing
    *   Display of matched Employee Information when face is recognised:
        *   Employee Photograph
        *   Employee Name
        *   Employee ID
    *   Three primary action buttons prominently displayed:
        *   Register New Employee
        *   Enter as Visitor
        *   View Entry Logs

## Face Recognition Process

1.  System captures Live Video feed from the webcam.
2.  Processes each frame for face detection.
3.  Compares detected face with the registered employee database.
4.  On match:
    *   Retrieves Employee data.
    *   Displays Information (Photograph, Name, ID).
    *   Logs entry in the database.
5.  On no match:
    *   Prompts for visitor entry or registration of employee.

## Employee Registration Process

1.  System requests Admin authentication.
2.  If correct admin ID is entered, the employee registration form is displayed.
3.  Data collection:
    *   Employee name entry.
    *   Live Photo capture via the webcam.
    *   Unique employee ID generation.
4.  New employee’s data gets updated in the MySQL Database.
5.  Return to the main interface.

## Security Features

*   Admin ID protection of sensitive functions.
*   Secure database connections.
*   Protected employee data access.
*   Encrypted data storage. (Note: Specific encryption details should be documented elsewhere.)

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
*   Web framework (Flask/Django) *(Specify which one is used)*.
*   JavaScript libraries for animations *(Specify which ones are used)*.
*   CSS framework for responsive design *(Specify which one is used)*.

## Maintenance Requirements

*   Regular database backups.
*   System log monitoring.
*   Face recognition model updates.
*   Security patches and updates.
*   Hardware maintenance (webcam).

## User Access and Instructions

**Accessing the System:**

The FRS is a web-based application. Access it by navigating to the designated drive link provided by the system administrator. https://drive.google.com/drive/folders/1RwMTdhzguMi1QpgO9SjEuAf1gnVGpbSd?usp=drive_link

**Using the System:**

**Main Interface:**

1.  Upon accessing the URL, you will be presented with the main interface.
2.  The live webcam feed will be displayed.
3.  To register a new employee, click the "Register New Employee" button. You will be prompted for admin authentication.
4.  To enter as a visitor, click the "Enter as Visitor" button and follow the on-screen prompts.
5.  To view entry logs, click the "View Entry Logs" button. You may need admin privileges to access this feature.

**Employee Registration:**

1.  Click "Register New Employee."
2.  Enter the correct Admin ID when prompted.
3.  Fill out the employee registration form, including the employee's name.
4.  Capture the employee's photo using the webcam.
5.  The system will generate a unique Employee ID.
6.  The new employee's data will be added to the database.

**Visitor Entry:**

1.  Click "Enter as Visitor."
2.  Visitor entry will be logged into the database with time logs.

**Viewing Entry Logs:**

1.  Click "View Entry Logs."
2.  Enter Admin credentials.
3.  The system will display the entry logs, including employee/visitor entry times and other relevant information.

**Troubleshooting:**

*   **Camera Access:** Ensure that your browser has permission to access your webcam.
*   **Face Recognition Issues:** If the system is not recognizing faces, ensure that the lighting is adequate and that the individual's face is clearly visible. Contact the system administrator if you continue to experience issues.
*   **Login Problems:** If you are having trouble logging in, contact the system administrator.

**[Admin ID: 123456]**

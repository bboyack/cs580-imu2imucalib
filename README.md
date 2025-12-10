# lidarimucalib
Lidar to IMU calibration using non-linear and linear regression. Final project for CS580 Fall 2025.

Author: Ben Boyack

# Code Set Up

## Data Gathering

The data used for this project was collected using an Inertial Sense IMU and an IMU inside an Ouster LiDAR. I drove the golf cart where these sensors are mounted up and down a ramp speeding up and slowing down as well as swerving to try and get a large variety of motion that would be detectable by the IMUs.

I used the files in the folder `format_data` to extract the IMU measurements from a ROS bag and then sort the data by timestamps. The processed data I used for the learning application of this project was `data/sorted_imu_data.csv`.

## Main Code File

The main learning code can be found in a jupyter file called [imu_imu_calibration.ipynb](imu_imu_calibration.ipynb). This file is designed to be run sequentially and explains the math along the way. You can set up your python environment using `conda` or `mamba` or the python environments as seen below.

### Set up python environment
Tested with python 3.12.3 but should work with most newer python versions.
```bash
python3 -m venv myenv
source myenv/bin/activate
pip install -r requirements.txt
```

---
---

# Project Description

## Why is Calibration Necessary?

 Autonomous robotic systems use sensors such as camera, light detection and ranging (LiDAR), inertial
measurement units (IMU), GPS, etc. to navigate the world around them. Many autonomous robots (like
self-driving cars) require extreme precision in sensor measurements to ensure the safety of people.​

 To maintain high precision, each sensor has both intrinsic calibration (to account for manufacturing
tolerances and other known biases) and extrinsic calibration (rotation and translation between sensors)
performed. The extrinsic calibration between two IMU sensors is the focus of this project and is essential
for transforming sensor data from local coordinate frames to the robot's coordinate frame. ​

## Current Problems

 Current methods for extrinsic IMU calibration,
whether IMU to IMU or IMU to LiDAR, have
high rotational accuracy but low translational
accuracy (with ground truth found using CAD
models). Many of these methods use different
types of Kalman Filters to estimate the rotation
and translation. ​

 To better understand the nuances and issues
involved with the lack in accuracy of extrinsic
IMU calibrations, this project focused on
the extrinsic calibration between two different
IMU sensors using both non-linear regression (for
rotation) and linear regression (for translation).
The sensors under test are mounted on a golfcart
(See image in [poster](BenBoyackTPMFinalProject.pdf)). Sensor 1 is by
the driver's seat and sensor 2 is on the top.​

## Methods and Results

Please see notes in [imu_imu_calibration.ipynb](imu_imu_calibration.ipynb) or the [poster](BenBoyackTPMFinalProject.pdf) for details of the full method as well as results.

## Conclusion

 IMU to IMU calibration is more challenging than most people think. IMUs only make relative
measurements which can easily be used to calculate the extrinsic rotation; however, the lack of
absolute measurements significantly complicates the translational calibration, especially for
ground vehicles that have limited motion. In practice hand measured translational measurements
are often good enough for most scenarios. ​

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Changelog for package av_car_description
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1.4.0 (2024-09-04)
------------------
* Update `robot_state_publisher` pkg to `ipab-rad` version for continously
  publish `tf_static`.

* Contributors: hect95

1.3.0 (2024-06-24)
------------------
* Prepend all sensor/optical frames with `camera\_`
* Add sensor and optical frames for all cameras
  - Sensor frame is a rotation of mount but in camera coordinates
  - Optical frame TF values now 0s will change in future when sensors are
    calibrated with each other (i.e. cross-sensor registration)
* Contributors: Alejandro Bordallo

1.2.0 (2024-06-05)
------------------
* Add bash args to optionally load local cyclone_dds
* Contributors: Alejandro Bordallo, hect95

1.1.0 (2024-05-21)
------------------
* Add Cyclone DDS ROS RMW and configure for high msg throughput
* Avoid overriding dev and runtime images when using docker scripts
* Allow colorised ROS log

1.0.1 (2024-04-30)
------------------
* Fix pkg names (`#3 <https://github.com/ipab-rad/av_car_description/issues/3>`_)
  This PR adds `av\_` prefix and correct all the references that contian
  `car_description` into `av_car_description`
* Contributors: Hector Cruz

1.0.0 (2024-04-26)
------------------
* Fix pre-commit linting, advice and suggestions
* Fix pkg names, vers. and descriptions pre-release
* Add Hector Cruz as maintainer
* Updating mondeo mesh to match Univeristy vehicle colors
* Add pre-commit config file and run it on repo
* Update Readme, remove unnecessary ament test deps
* Port original pkg to ROS2
* Contributors: Alejandro Bordallo, hect95

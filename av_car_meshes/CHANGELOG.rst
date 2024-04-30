^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Changelog for package av_car_meshes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Forthcoming
-----------
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
* Updating car meshes to match university colors and avoid errors in RVIZ
  - mondeo_blue.dae is modified to points to a new grey color scheme png images
  - mondeo_blue_body.png is deleted
* Changing CMakeLists installation to align with ROS2 convention rather than using catkin macros
* Add pre-commit config file and run it on repo
* Port original pkg to ROS2
* Contributors: Alejandro Bordallo, hect95

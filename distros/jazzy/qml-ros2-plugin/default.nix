
# Copyright 2024 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-index-cpp, ament-lint-auto, example-interfaces, image-transport, qt5, rclcpp, ros-babel-fish, ros-babel-fish-test-msgs, std-srvs, tf2-ros, yaml-cpp }:
buildRosPackage {
  pname = "ros-jazzy-qml-ros2-plugin";
  version = "1.0.1-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/qml_ros2_plugin-release/archive/release/jazzy/qml_ros2_plugin/1.0.1-1.tar.gz";
    name = "1.0.1-1.tar.gz";
    sha256 = "1c691e1eb5decad3483eae738999b52a9c9002ceb63821a77ee16c86fc0d113a";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto example-interfaces qt5.qtquickcontrols2 ros-babel-fish-test-msgs std-srvs ];
  propagatedBuildInputs = [ ament-index-cpp image-transport qt5.qtbase qt5.qtdeclarative qt5.qtmultimedia rclcpp ros-babel-fish tf2-ros yaml-cpp ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = "A QML plugin for ROS.
    Enables full communication with ROS from QML.";
    license = with lib.licenses; [ mit ];
  };
}
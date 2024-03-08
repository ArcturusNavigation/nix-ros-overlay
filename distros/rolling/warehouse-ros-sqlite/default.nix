
# Copyright 2024 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-copyright, ament-cmake-gtest, ament-lint-auto, ament-lint-common, boost, class-loader, geometry-msgs, rclcpp, sqlite, sqlite3-vendor, warehouse-ros }:
buildRosPackage {
  pname = "ros-rolling-warehouse-ros-sqlite";
  version = "1.0.3-r3";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/warehouse_ros_sqlite-release/archive/release/rolling/warehouse_ros_sqlite/1.0.3-3.tar.gz";
    name = "1.0.3-3.tar.gz";
    sha256 = "e65452dbc3184a7c334f4c2a720e88c3117aeddedd5ae263e43683132bce5739";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake boost sqlite3-vendor ];
  checkInputs = [ ament-cmake-copyright ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs ];
  propagatedBuildInputs = [ class-loader rclcpp sqlite warehouse-ros ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''Implementation of warehouse_ros for sqlite'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}

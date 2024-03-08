
# Copyright 2024 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core, ament-package, cmake }:
buildRosPackage {
  pname = "ros-rolling-ros-workspace";
  version = "1.0.3-r5";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/ros_workspace-release/archive/release/rolling/ros_workspace/1.0.3-5.tar.gz";
    name = "1.0.3-5.tar.gz";
    sha256 = "b14da432595ba47a9a9bd7771f9c323a28e02534d6d08ed02b1a590b10202332";
  };

  buildType = "cmake";
  buildInputs = [ ament-cmake-core ament-package cmake ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = ''Provides the prefix level environment files for ROS 2 packages.'';
    license = with lib.licenses; [ asl20 ];
  };
}

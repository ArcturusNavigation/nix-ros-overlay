
# Copyright 2024 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake-core, gtest, lanelet2-core, lanelet2-io, lanelet2-matching, lanelet2-projection, lanelet2-python, lanelet2-routing, lanelet2-traffic-rules, mrt-cmake-modules, ros2cli }:
buildRosPackage {
  pname = "ros-rolling-lanelet2-examples";
  version = "1.2.1-r5";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/lanelet2-release/archive/release/rolling/lanelet2_examples/1.2.1-5.tar.gz";
    name = "1.2.1-5.tar.gz";
    sha256 = "471dd38643b9a484060fe5b077615c8865727b3c33fe592ef4f603ca8b9c80d4";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake-core ];
  checkInputs = [ gtest ];
  propagatedBuildInputs = [ lanelet2-core lanelet2-io lanelet2-matching lanelet2-projection lanelet2-python lanelet2-routing lanelet2-traffic-rules mrt-cmake-modules ros2cli ];
  nativeBuildInputs = [ ament-cmake-core mrt-cmake-modules ];

  meta = {
    description = ''Examples for working with Lanelet2'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}

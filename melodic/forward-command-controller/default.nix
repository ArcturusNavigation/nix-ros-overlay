
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, hardware-interface, realtime-tools, catkin, controller-interface, std-msgs }:
buildRosPackage {
  pname = "ros-melodic-forward-command-controller";
  version = "0.15.0";

  src = fetchurl {
    url = https://github.com/ros-gbp/ros_controllers-release/archive/release/melodic/forward_command_controller/0.15.0-0.tar.gz;
    sha256 = "811c1ec365f2d1e20a0c2269f4b678683e6b71788a4adc5c64379e3e523c2ab0";
  };

  buildInputs = [ std-msgs hardware-interface controller-interface realtime-tools ];
  propagatedBuildInputs = [ std-msgs hardware-interface controller-interface realtime-tools ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''forward_command_controller'';
    #license = lib.licenses.BSD;
  };
}


# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, message-generation, message-runtime, std-msgs, geometry-msgs }:
buildRosPackage {
  pname = "ros-melodic-tuw-object-msgs";
  version = "0.0.13";

  src = fetchurl {
    url = https://github.com/tuw-robotics/tuw_msgs-release/archive/release/melodic/tuw_object_msgs/0.0.13-0.tar.gz;
    sha256 = "cd872b1996ab016b75719c00f199bef95322fabf5efc964a169a6dd362fdec8f";
  };

  buildInputs = [ std-msgs message-generation geometry-msgs ];
  propagatedBuildInputs = [ std-msgs message-runtime geometry-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The tuw_object_msgs package. This pkg provides a set of messages used to detect, map and track objects of different types.'';
    #license = lib.licenses.BSD;
  };
}

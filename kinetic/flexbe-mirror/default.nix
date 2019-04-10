
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, flexbe-msgs, catkin, smach-ros, flexbe-widget, rospy, flexbe-core }:
buildRosPackage {
  pname = "ros-kinetic-flexbe-mirror";
  version = "1.1.2";

  src = fetchurl {
    url = https://github.com/FlexBE/flexbe_behavior_engine-release/archive/release/kinetic/flexbe_mirror/1.1.2-0.tar.gz;
    sha256 = "01c35e51ffbb871c2c0840da020b0a6af50150df6ceccedd9fbb56e6d4a5486b";
  };

  propagatedBuildInputs = [ flexbe-widget flexbe-msgs rospy smach-ros flexbe-core ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''flexbe_mirror implements functionality to remotely mirror an executed behavior.'';
    #license = lib.licenses.BSD;
  };
}

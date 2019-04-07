
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, pr2-controllers-msgs, pr2-mechanism-controllers, actionlib-msgs, catkin, robot-mechanism-controllers, actionlib, roscpp, pr2-mechanism-model }:
buildRosPackage {
  pname = "ros-melodic-pr2-gripper-action";
  version = "1.10.15-r1";

  src = fetchurl {
    url = https://github.com/pr2-gbp/pr2_controllers-release/archive/release/melodic/pr2_gripper_action/1.10.15-1.tar.gz;
    sha256 = "c2af780c2458ba7a28fcef738f8b231d59367ee9e82aea74f9fe4802216b6402";
  };

  buildInputs = [ pr2-controllers-msgs pr2-mechanism-controllers actionlib-msgs actionlib roscpp pr2-mechanism-model robot-mechanism-controllers ];
  propagatedBuildInputs = [ pr2-controllers-msgs pr2-mechanism-controllers actionlib-msgs actionlib roscpp pr2-mechanism-model robot-mechanism-controllers ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''The pr2_gripper_action provides an action interface for using the
  gripper. Users can specify what position to move to (while limiting the
  force) and the action will report success when the position is reached or
  failure when the gripper cannot move any longer.'';
    #license = lib.licenses.BSD;
  };
}

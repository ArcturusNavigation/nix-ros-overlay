
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, flexbe-msgs, flexbe-mirror, catkin, flexbe-states, flexbe-onboard, flexbe-input, flexbe-widget, flexbe-testing, flexbe-core }:
buildRosPackage {
  pname = "ros-kinetic-flexbe-behavior-engine";
  version = "1.1.2";

  src = fetchurl {
    url = https://github.com/FlexBE/flexbe_behavior_engine-release/archive/release/kinetic/flexbe_behavior_engine/1.1.2-0.tar.gz;
    sha256 = "0f434aca44be51993915062169c8cb8fd65eb1e953b1606c3d15a747b36709c7";
  };

  propagatedBuildInputs = [ flexbe-input flexbe-widget flexbe-msgs flexbe-testing flexbe-mirror flexbe-onboard flexbe-states flexbe-core ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''A meta-package to aggregate all the FlexBE packages'';
    #license = lib.licenses.BSD;
  };
}

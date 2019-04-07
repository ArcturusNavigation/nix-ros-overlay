
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, can-msgs, catkin, pacmod-msgs, std-msgs, roscpp }:
buildRosPackage {
  pname = "ros-melodic-pacmod3";
  version = "1.2.1";

  src = fetchurl {
    url = https://github.com/astuff/pacmod3-release/archive/release/melodic/pacmod3/1.2.1-0.tar.gz;
    sha256 = "daff58bf63c7d7e4d76b098f59076691ba3bb27401201eb39681d229ad256bf0";
  };

  buildInputs = [ std-msgs can-msgs roscpp pacmod-msgs ];
  propagatedBuildInputs = [ std-msgs can-msgs roscpp pacmod-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''AutonomouStuff PACMod v3 Driver Package'';
    #license = lib.licenses.MIT;
  };
}

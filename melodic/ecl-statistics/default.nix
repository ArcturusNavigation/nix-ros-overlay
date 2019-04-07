
# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, ecl-build, ecl-license, ecl-type-traits, ecl-linear-algebra, ecl-config, ecl-mpl }:
buildRosPackage {
  pname = "ros-melodic-ecl-statistics";
  version = "0.62.2";

  src = fetchurl {
    url = https://github.com/yujinrobot-release/ecl_core-release/archive/release/melodic/ecl_statistics/0.62.2-0.tar.gz;
    sha256 = "67ed25a3f69aa9d272c6c700e2b079115fddd28ed7b0f020f1fec28061a7579b";
  };

  buildInputs = [ ecl-build ecl-license ecl-type-traits ecl-linear-algebra ecl-config ecl-mpl ];
  propagatedBuildInputs = [ ecl-build ecl-license ecl-type-traits ecl-linear-algebra ecl-config ecl-mpl ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''Common statistical structures and algorithms for control systems.'';
    #license = lib.licenses.BSD;
  };
}

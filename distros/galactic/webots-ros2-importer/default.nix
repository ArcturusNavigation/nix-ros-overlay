
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-copyright, ament-flake8, ament-pep257, builtin-interfaces, python3Packages, pythonPackages, xacro }:
buildRosPackage {
  pname = "ros-galactic-webots-ros2-importer";
  version = "2022.1.3-r1";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/webots_ros2-release/archive/release/galactic/webots_ros2_importer/2022.1.3-1.tar.gz";
    name = "2022.1.3-1.tar.gz";
    sha256 = "eca4d7bfecfbb92f6671dde2224dabe32a80271b3c1cad563a167681034ee512";
  };

  buildType = "ament_python";
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 python3Packages.numpy python3Packages.pillow python3Packages.pycodestyle pythonPackages.pytest ];
  propagatedBuildInputs = [ builtin-interfaces python3Packages.lark python3Packages.pycollada xacro ];

  meta = {
    description = ''This package allows to convert URDF and XACRO files into Webots PROTO files.'';
    license = with lib.licenses; [ asl20 ];
  };
}

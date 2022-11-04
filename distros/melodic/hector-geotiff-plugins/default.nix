
# Copyright 2022 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, catkin, hector-geotiff, hector-nav-msgs }:
buildRosPackage {
  pname = "ros-melodic-hector-geotiff-plugins";
  version = "0.4.1-r1";

  src = fetchurl {
    url = "https://github.com/tu-darmstadt-ros-pkg-gbp/hector_slam-release/archive/release/melodic/hector_geotiff_plugins/0.4.1-1.tar.gz";
    name = "0.4.1-1.tar.gz";
    sha256 = "bad8710701ff02823d3cb1f85bf510bb986c55a91ecb498576dbdbbd931444f0";
  };

  buildType = "catkin";
  propagatedBuildInputs = [ hector-geotiff hector-nav-msgs ];
  nativeBuildInputs = [ catkin ];

  meta = {
    description = ''hector_geotiff_plugins contains plugins that extend geotiff maps generated by hector_geotiff.'';
    license = with lib.licenses; [ bsdOriginal ];
  };
}


# Copyright 2024 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, assimp, cmake, cv-bridge, ffmpeg, freeglut, freenect, glfw3, libGL, libGLU, libjpeg, libpcap, libusb1, mrpt-libopengl, octomap, opencv, openni2, pkg-config, python3Packages, pythonPackages, ros-environment, rosbag-storage, roscpp, tf2-geometry-msgs, tinyxml-2, udev, wxGTK32, xorg, zlib }:
buildRosPackage {
  pname = "ros-noetic-mrpt-libgui";
  version = "2.14.5-r1";

  src = fetchurl {
    url = "https://github.com/mrpt-ros-pkg-release/mrpt_ros-release/archive/release/noetic/mrpt_libgui/2.14.5-1.tar.gz";
    name = "2.14.5-1.tar.gz";
    sha256 = "5536fc575daf465f2c16440e01bcce83efe6ea29128fd30ca28a82a0836c7784";
  };

  buildType = "cmake";
  buildInputs = [ assimp cmake cv-bridge ffmpeg freeglut freenect libGL libGLU libjpeg libpcap libusb1 octomap opencv opencv.cxxdev openni2 pkg-config python3Packages.pip pythonPackages.pybind11 ros-environment rosbag-storage roscpp tf2-geometry-msgs tinyxml-2 udev wxGTK32 xorg.libXrandr xorg.libXxf86vm zlib ];
  propagatedBuildInputs = [ glfw3 mrpt-libopengl ];
  nativeBuildInputs = [ cmake ];

  meta = {
    description = "Mobile Robot Programming Toolkit (MRPT) libraries (GUI C++ libraries).
  This package contains: mrpt-gui, nanogui";
    license = with lib.licenses; [ bsdOriginal ];
  };
}
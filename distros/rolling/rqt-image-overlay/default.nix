
# Copyright 2024 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

{ lib, buildRosPackage, fetchurl, ament-cmake, ament-cmake-gtest, ament-lint-auto, ament-lint-common, compressed-image-transport, image-transport, pluginlib, qt5, rclcpp, ros-image-to-qimage, rqt-gui, rqt-gui-cpp, rqt-image-overlay-layer, std-msgs }:
buildRosPackage {
  pname = "ros-rolling-rqt-image-overlay";
  version = "0.3.1-r3";

  src = fetchurl {
    url = "https://github.com/ros2-gbp/rqt_image_overlay-release/archive/release/rolling/rqt_image_overlay/0.3.1-3.tar.gz";
    name = "0.3.1-3.tar.gz";
    sha256 = "52a4710b8e90138d386551353fbb555713d9ba29d76f225a15a42ad18219bb9e";
  };

  buildType = "ament_cmake";
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common compressed-image-transport std-msgs ];
  propagatedBuildInputs = [ image-transport pluginlib qt5.qtbase rclcpp ros-image-to-qimage rqt-gui rqt-gui-cpp rqt-image-overlay-layer ];
  nativeBuildInputs = [ ament-cmake ];

  meta = {
    description = ''An rqt plugin to display overlays for custom msgs on an image using plugins.'';
    license = with lib.licenses; [ asl20 ];
  };
}

# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6} )

inherit ament-cmake

DESCRIPTION="Utilities for flashing and enabling Kobuki\'s USB connection.\
\		This p[...]"
HOMEPAGE="http://ros.org/wiki/kobuki_ftdi"
SRC_URI="https://github.com/yujinrobot-release/kobuki_core-release/archive/release/eloquent/${PN}/0.8.1-1.tar.gz -> ${PN}-eloquent-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-eloquent/ecl_command_line
	dev-embedded/ftdi_eeprom
	dev-embedded/libftdi
	virtual/libusb
"
DEPEND="${RDEPEND}
	ros-eloquent/ament_cmake_ros
	ros-eloquent/ecl_build
	virtual/pkgconfig
"

SLOT="0"
ROS_DISTRO="eloquent"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

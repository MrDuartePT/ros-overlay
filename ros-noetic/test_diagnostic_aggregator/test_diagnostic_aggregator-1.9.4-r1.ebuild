# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit ros-cmake

DESCRIPTION="Basic diagnostic_aggregator tests are  in the"
HOMEPAGE="http://ros.org/wiki/test_diagnostic_aggregator"
SRC_URI="https://github.com/ros-gbp/diagnostics-release/archive/release/noetic/${PN}/1.9.4-1.tar.gz -> ${PN}-noetic-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-noetic/diagnostic_aggregator
	ros-noetic/diagnostic_msgs
	ros-noetic/pluginlib
	ros-noetic/roscpp
	ros-noetic/rospy
"
DEPEND="${RDEPEND}
	ros-noetic/catkin
	ros-noetic/rostest
"

SLOT="0"
ROS_DISTRO="noetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

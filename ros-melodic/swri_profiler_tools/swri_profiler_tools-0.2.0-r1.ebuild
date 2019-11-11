# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit ros-cmake

DESCRIPTION="Provides tools for viewing data produced by nodes that use the\
	swri_pr[...]"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/swri-robotics-gbp/swri_profiler-release/archive/release/melodic/${PN}/0.2.0-1.tar.gz -> ${PN}-melodic-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-melodic/libqt_core
	ros-melodic/libqt_dev
	ros-melodic/libqt_gui
	ros-melodic/libqt_widgets
	ros-melodic/roscpp
	ros-melodic/std_msgs
	ros-melodic/swri_profiler_msgs
"
DEPEND="${RDEPEND}
	ros-melodic/catkin
	ros-melodic/qt_qmake
"

SLOT="0"
ROS_DISTRO="melodic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

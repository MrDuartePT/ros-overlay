# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit ros-cmake

DESCRIPTION="rqt_robot_monitor displays diagnostics_agg topics messages that\
   are pub[...]"
HOMEPAGE="http://wiki.ros.org/rqt_robot_monitor"
SRC_URI="https://github.com/ros-gbp/${PN}-release/archive/release/kinetic/${PN}/0.5.8-1.tar.gz -> ${PN}-kinetic-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/diagnostic_msgs
	ros-kinetic/python_qt_binding
	ros-kinetic/qt_gui
	ros-kinetic/qt_gui_py_common
	ros-kinetic/rospy
	ros-kinetic/rqt_bag
	ros-kinetic/rqt_gui
	ros-kinetic/rqt_gui_py
	ros-kinetic/rqt_py_common
	dev-python/rospkg
"
DEPEND="${RDEPEND}
	ros-kinetic/catkin
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

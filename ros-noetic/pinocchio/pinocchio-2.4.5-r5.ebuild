# Copyright 2020 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit ros-cmake

DESCRIPTION="A fast and flexible implementation of Rigid Body Dynamics algorithms and th[...]"
HOMEPAGE="https://github.com/stack-of-tasks/pinocchio"
SRC_URI="https://github.com/ipab-slmc/${PN}_catkin-release/archive/release/noetic/${PN}/2.4.5-5.tar.gz -> ${PN}-noetic-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-noetic/eigenpy
	dev-libs/boost[python]
	dev-cpp/eigen
	dev-libs/urdfdom
	dev-lang/python
	dev-python/numpy
	dev-lang/python
	dev-python/numpy
"
DEPEND="${RDEPEND}
	dev-util/cmake
	app-doc/doxygen
	dev-vcs/git
"

SLOT="0"
ROS_DISTRO="noetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

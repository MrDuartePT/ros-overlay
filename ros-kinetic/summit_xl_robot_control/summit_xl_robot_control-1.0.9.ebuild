# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Control the robot joints in all kinematic configurations, publishes odom topic and, 
	  if configured, also tf odom to base_link. Usually takes as input joystick commands 
	  and generates as outputs references for the gazebo controllers defined in summit_xl_control."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/RobotnikAutomation/summit_xl_sim-release/archive/release/kinetic/summit_xl_robot_control/1.0.9-2.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/sensor_msgs
    ros-kinetic/nav_msgs
    ros-kinetic/diagnostic_msgs
    ros-kinetic/diagnostic_updater
    ros-kinetic/roscpp
    ros-kinetic/tf
    ros-kinetic/robotnik_msgs
    ros-kinetic/geometry_msgs
"
DEPEND="
    ros-kinetic/sensor_msgs
    ros-kinetic/nav_msgs
    ros-kinetic/diagnostic_msgs
    ros-kinetic/diagnostic_updater
    ros-kinetic/roscpp
    ros-kinetic/tf
    ros-kinetic/robotnik_msgs
    ros-kinetic/geometry_msgs
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo

src_unpack() {
    wget -O ${P}.tar.gz ${SRC_URI}
    tar -xf ${P}.tar.gz
    rm -f ${P}.tar.gz
    mv *${P}* ${P}
}

src_configure() {
    mkdir ${WORKDIR}/src
    cp -R ${WORKDIR}/${P} ${WORKDIR}/src/${P}
}

src_compile() {
    echo ""
}

src_install() {
    echo ""
}

pkg_postinst() {
    cd ../work
    source /opt/ros/kinetic/setup.bash
    catkin_make_isolated --install --install-space="/opt/ros/kinetic" || die
}

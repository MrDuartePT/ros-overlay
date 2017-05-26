# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This package describes basic function to control THORMANG3's upper-body.
    This module is based on position control.
    We provide joint space and task space control (forward kinematics, inverse kinematics)."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ROBOTIS-GIT-release/ROBOTIS-THORMANG-MPC-release/archive/release/kinetic/thormang3_manipulation_module/0.1.3-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/robotis_framework_common
    ros-kinetic/cmake_modules
    ros-kinetic/thormang3_kinematics_dynamics
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    ros-kinetic/robotis_math
    ros-kinetic/geometry_msgs
"
DEPEND="
    ros-kinetic/robotis_framework_common
    ros-kinetic/cmake_modules
    ros-kinetic/thormang3_manipulation_module_msgs
    ros-kinetic/thormang3_kinematics_dynamics
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    ros-kinetic/robotis_math
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

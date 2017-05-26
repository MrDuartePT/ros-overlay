# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The manipulator_h_gui package
    This package provides simple GUI to control ROBOTIS MANIPULATOR-H.
    This GUI is connected to manipulator_h_base_module."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ROBOTIS-GIT-release/ROBOTIS-MANIPULATOR-H-release/archive/release/kinetic/manipulator_h_gui/0.2.2-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/cmake_modules
    ros-kinetic/qt_build
    ros-kinetic/roscpp
    ros-kinetic/geometry_msgs
    ros-kinetic/eigen_conversions
    dev-qt/qtcore
"
DEPEND="
    ros-kinetic/cmake_modules
    ros-kinetic/robotis_controller_msgs
    ros-kinetic/qt_build
    ros-kinetic/roscpp
    ros-kinetic/manipulator_h_base_module_msgs
    ros-kinetic/geometry_msgs
    ros-kinetic/eigen_conversions
    dev-qt/qtcore
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

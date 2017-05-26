# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Meta package to interface ROS with Aldebaran's NAOqi."
HOMEPAGE="http://ros.org/wiki/nao"
SRC_URI="https://github.com/ros-naoqi/naoqi_bridge-release/archive/release/kinetic/naoqi_bridge/0.5.5-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/naoqi_driver_py
    ros-kinetic/naoqi_apps
    ros-kinetic/naoqi_tools
    ros-kinetic/naoqi_driver
    ros-kinetic/naoqi_sensors_py
    ros-kinetic/naoqi_pose
    ros-kinetic/naoqi_bridge_msgs
"
DEPEND="
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
# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="jsk_ik_server"
HOMEPAGE="http://ros.org/wiki/jsk_ik_server"
SRC_URI="https://github.com/tork-a/jsk_control-release/archive/release/kinetic/jsk_ik_server/0.1.13-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/cmake_modules
    ros-kinetic/tf
    ros-kinetic/rostest
    ros-kinetic/mk
    ros-kinetic/roseus
    ros-kinetic/moveit_msgs
"
DEPEND="
    ros-kinetic/cmake_modules
    ros-kinetic/tf
    ros-kinetic/rostest
    ros-kinetic/mk
    ros-kinetic/roseus
    ros-kinetic/moveit_msgs
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

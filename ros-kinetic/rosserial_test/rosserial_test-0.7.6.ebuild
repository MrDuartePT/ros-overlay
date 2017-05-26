# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="A specialized harness which allows end-to-end integration testing of the
    rosserial client and server components."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/rosserial-release/archive/release/kinetic/rosserial_test/0.7.6-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/rosserial_python
    ros-kinetic/rosserial_msgs
    ros-kinetic/rosserial_client
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    ros-kinetic/rostest
    ros-kinetic/rosserial_server
    dev-cpp/gtest
"
DEPEND="
    ros-kinetic/rosserial_python
    ros-kinetic/rosserial_msgs
    ros-kinetic/rosserial_client
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    ros-kinetic/rostest
    ros-kinetic/rosserial_server
    dev-cpp/gtest
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

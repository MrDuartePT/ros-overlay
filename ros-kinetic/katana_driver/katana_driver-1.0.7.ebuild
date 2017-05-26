# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This stack contains all descriptions, drivers and bringup facilities for Neuronics Katana 450 arm."
HOMEPAGE="http://ros.org/wiki/katana_driver"
SRC_URI="https://github.com/uos-gbp/katana_driver-release/archive/release/kinetic/katana_driver/1.0.7-0.tar.gz"

LICENSE="BSD, GPL"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/katana_description
    ros-kinetic/katana_arm_gazebo
    ros-kinetic/katana_moveit_ikfast_plugin
    ros-kinetic/katana_teleop
    ros-kinetic/kni
    ros-kinetic/katana_gazebo_plugins
    ros-kinetic/katana_msgs
    ros-kinetic/katana
    ros-kinetic/katana_tutorials
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

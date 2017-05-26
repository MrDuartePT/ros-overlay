# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="pointcloud_tools"
HOMEPAGE="http://ros.org/wiki/pointcloud_tools"
SRC_URI="https://github.com/srv/srv_tools-release/archive/release/kinetic/pointcloud_tools/0.0.3-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/pcl_ros
    ros-kinetic/pcl_conversions
    ros-kinetic/sensor_msgs
    ros-kinetic/nav_msgs
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    sci-libs/vtk
"
DEPEND="
    ros-kinetic/pcl_ros
    ros-kinetic/pcl_conversions
    ros-kinetic/sensor_msgs
    ros-kinetic/nav_msgs
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    sci-libs/vtk
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
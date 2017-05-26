# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This package is a ROS wrapper for Alvar, an open source AR tag tracking library."
HOMEPAGE="http://ros.org/wiki/ar_track_alvar"
SRC_URI="https://github.com/ros-gbp/ar_track_alvar-release/archive/release/kinetic/ar_track_alvar/0.7.0-1.tar.gz"

LICENSE="LGPL-2.1"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/pcl_ros
    ros-kinetic/rospy
    ros-kinetic/pcl_conversions
    ros-kinetic/image_transport
    ros-kinetic/sensor_msgs
    ros-kinetic/cv_bridge
    ros-kinetic/tf2
    ros-kinetic/roscpp
    ros-kinetic/visualization_msgs
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/message_runtime
    ros-kinetic/ar_track_alvar_msgs
    ros-kinetic/std_msgs
    ros-kinetic/geometry_msgs
    ros-kinetic/tf
    ros-kinetic/resource_retriever
    dev-libs/tinyxml
"
DEPEND="
    ros-kinetic/pcl_ros
    ros-kinetic/rospy
    ros-kinetic/pcl_conversions
    ros-kinetic/cmake_modules
    ros-kinetic/image_transport
    ros-kinetic/sensor_msgs
    ros-kinetic/cv_bridge
    ros-kinetic/tf2
    ros-kinetic/roscpp
    ros-kinetic/visualization_msgs
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/tf
    ros-kinetic/message_generation
    ros-kinetic/ar_track_alvar_msgs
    ros-kinetic/geometry_msgs
    ros-kinetic/std_msgs
    ros-kinetic/resource_retriever
    dev-libs/tinyxml
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

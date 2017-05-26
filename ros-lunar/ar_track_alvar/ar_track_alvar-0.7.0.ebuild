# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This package is a ROS wrapper for Alvar, an open source AR tag tracking library."
HOMEPAGE="http://ros.org/wiki/ar_track_alvar"
SRC_URI="https://github.com/ros-gbp/ar_track_alvar-release/archive/release/lunar/ar_track_alvar/0.7.0-0.tar.gz"

LICENSE="LGPL-2.1"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/std_msgs
    ros-lunar/roscpp
    ros-lunar/image_transport
    ros-lunar/ar_track_alvar_msgs
    ros-lunar/resource_retriever
    ros-lunar/rospy
    ros-lunar/sensor_msgs
    ros-lunar/visualization_msgs
    ros-lunar/dynamic_reconfigure
    ros-lunar/pcl_ros
    ros-lunar/tf2
    ros-lunar/message_runtime
    ros-lunar/cv_bridge
    ros-lunar/geometry_msgs
    ros-lunar/tf
    ros-lunar/pcl_conversions
    dev-libs/tinyxml
"
DEPEND="
    ros-lunar/message_generation
    ros-lunar/std_msgs
    ros-lunar/roscpp
    ros-lunar/image_transport
    ros-lunar/ar_track_alvar_msgs
    ros-lunar/resource_retriever
    ros-lunar/rospy
    ros-lunar/sensor_msgs
    ros-lunar/visualization_msgs
    ros-lunar/dynamic_reconfigure
    ros-lunar/pcl_ros
    ros-lunar/tf2
    ros-lunar/cv_bridge
    ros-lunar/geometry_msgs
    ros-lunar/cmake_modules
    ros-lunar/tf
    ros-lunar/pcl_conversions
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
    source /opt/ros/lunar/setup.bash
    catkin_make_isolated --install --install-space="/opt/ros/lunar" || die
}

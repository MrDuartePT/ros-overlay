# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This is a set of tools for recording from and playing back to ROS
    topics.  It is intended to be high performance and avoids
    deserialization and reserialization of the messages."
HOMEPAGE="http://ros.org/wiki/rosbag"
SRC_URI="https://github.com/ros-gbp/ros_comm-release/archive/release/kinetic/rosbag/1.12.7-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/genpy
    ros-kinetic/rospy
    ros-kinetic/std_srvs
    ros-kinetic/rosconsole
    ros-kinetic/topic_tools
    ros-kinetic/roslib
    ros-kinetic/roscpp
    ros-kinetic/rosbag_storage
    ros-kinetic/genmsg
    ros-kinetic/xmlrpcpp
    dev-libs/boost
    dev-python/rospkg
"
DEPEND="
    ros-kinetic/std_srvs
    ros-kinetic/rosconsole
    ros-kinetic/topic_tools
    ros-kinetic/roscpp
    ros-kinetic/rosbag_storage
    ros-kinetic/roscpp_serialization
    ros-kinetic/xmlrpcpp
    ros-kinetic/cpp_common
    dev-libs/boost
    dev-python/pillow
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
# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

inherit cmake-utils eutils

DESCRIPTION="multisense_ros"
HOMEPAGE="https://bitbucket.org/crl/multisense_ros"
SRC_URI="https://github.com/carnegieroboticsllc/multisense_ros-release/archive/release/indigo/multisense_ros/4.0.0-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"
PYTHON_DEPEND="3::3.5"

RDEPEND="
    ros-indigo/angles
    ros-indigo/cv_bridge
    ros-indigo/dynamic_reconfigure
    ros-indigo/genmsg
    ros-indigo/geometry_msgs
    ros-indigo/image_geometry
    ros-indigo/image_transport
    ros-indigo/message_generation
    ros-indigo/message_runtime
    ros-indigo/multisense_lib
    ros-indigo/rosbag
    ros-indigo/roscpp
    ros-indigo/sensor_msgs
    ros-indigo/std_msgs
    ros-indigo/stereo_msgs
    ros-indigo/tf
    media-libs/libjpeg-turbo
"
DEPEND="${RDEPEND}
    ros-indigo/catkin
    dev-cpp/yaml-cpp
"

SLOT="0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/indigo"

src_unpack() {
    default
    mv *${P}* ${P}
}

src_configure() {
    append-cxxflags "-std=c++11"
    export DEST_SETUP_DIR="/${ROS_PREFIX}"
    local mycmakeargs=(
        -DCMAKE_INSTALL_PREFIX=${D}${ROS_PREFIX}
        -DCMAKE_PREFIX_PATH=/${ROS_PREFIX}
        -DPYTHON_INSTALL_DIR=lib64/python3.5/site-packages
        -DCATKIN_ENABLE_TESTING=OFF
        -DPYTHON_EXECUTABLE=/usr/bin/ros-python-indigo
        -DCATKIN_BUILD_BINARY_PACKAGE=1
     )
    cmake-utils_src_configure
}

src_install() {
    cd ${WORKDIR}/${P}_build
    make install || die
}
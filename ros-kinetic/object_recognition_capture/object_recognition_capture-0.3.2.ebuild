# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Capture is a set of tools to capture objects in 3D and perform odometry"
HOMEPAGE="http://wg-perception.github.io/capture"
SRC_URI="https://github.com/ros-gbp/object_recognition_capture-release/archive/release/kinetic/object_recognition_capture/0.3.2-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/ecto_openni
    ros-kinetic/ecto_image_pipeline
    ros-kinetic/ecto_opencv
    ros-kinetic/object_recognition_core
    ros-kinetic/ecto
    ros-kinetic/ecto_ros
    dev-libs/boost
"
DEPEND="
    ros-kinetic/object_recognition_core
    ros-kinetic/ecto
    dev-libs/boost
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

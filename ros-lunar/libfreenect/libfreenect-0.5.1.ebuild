# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Open source libraries that will enable the Kinect to be used with Windows, Linux, and Mac."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-drivers-gbp/libfreenect-ros-release/archive/release/lunar/libfreenect/0.5.1-0.tar.gz"

LICENSE="Apache 2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/catkin
    =dev-libs/libusb-1.0*
    media-libs/freeglut
    x11-libs/libXmu
    x11-libs/libXi
"
DEPEND="${RDEPEND}
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
    cd ../../work
    source /opt/ros/lunar/setup.bash
    catkin_make_isolated --install --install-space="${D}" || die
}

pkg_postinst() {
    cd ${D}
    cp -R lib* /opt/ros/lunar
    cp -R share /opt/ros/lunar
    cp -R bin /opt/ros/lunar
    cp -R include /opt/ros/lunar
}
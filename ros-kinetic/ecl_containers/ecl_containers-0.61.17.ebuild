# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The containers included here are intended to extend the stl containers.
    In all cases, these implementations are designed to implement
    c++ conveniences and safety where speed is not sacrificed. 

    Also includes techniques for memory debugging of common problems such
    as buffer overruns."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/yujinrobot-release/ecl_core-release/archive/release/kinetic/ecl_containers/0.61.17-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/ecl_exceptions
    ros-kinetic/ecl_mpl
    ros-kinetic/ecl_errors
    ros-kinetic/ecl_config
    ros-kinetic/ecl_license
    ros-kinetic/ecl_formatters
    ros-kinetic/ecl_converters
    ros-kinetic/ecl_utilities
    ros-kinetic/ecl_type_traits
"
DEPEND="
    ros-kinetic/ecl_exceptions
    ros-kinetic/ecl_mpl
    ros-kinetic/ecl_errors
    ros-kinetic/ecl_config
    ros-kinetic/ecl_license
    ros-kinetic/ecl_formatters
    ros-kinetic/ecl_converters
    ros-kinetic/ecl_utilities
    ros-kinetic/ecl_type_traits
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
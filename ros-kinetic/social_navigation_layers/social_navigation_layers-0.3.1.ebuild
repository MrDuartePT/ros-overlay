# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Plugin-based layers for the navigation stack that 
  implement various social navigation contraints, like proxemic distance."
HOMEPAGE="http://ros.org/wiki/social_navigation_layers"
SRC_URI="https://github.com/wu-robotics/navigation_layers_release/archive/release/kinetic/social_navigation_layers/0.3.1-1.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/roscpp
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/costmap_2d
    ros-kinetic/people_msgs
"
DEPEND="
    ros-kinetic/roscpp
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/costmap_2d
    ros-kinetic/people_msgs
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

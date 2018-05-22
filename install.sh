#!/bin/bash

dependencies=(
  git intltool gcc gcc-c++ vala meson ninja-build
  gnome-common gtk3-devel clutter-devel clutter-gtk-devel
  gsl-devel webkitgtk4-devel libpeas-devel comedilib-devel librsvg2-devel
  libusbx libusbx-devel hidapi hidapi-devel gtksourceview3-devel
)

dnf -y install ${dependencies[*]}

CACHEDIR="/var/cache/fedy/dactl"

mkdir -p $CACHEDIR
cd $CACHEDIR

git clone https://github.com/geoffjay/comedi-vapi.git
mkdir -p /usr/local/lib/pkgconfig
cp comedi-vapi/comedi.pc /usr/local/lib/pkgconfig/
cp comedi-vapi/comedi.vapi /usr/share/vala/vapi/
PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/

dnf -y copr enable geoffjay/libcld
dnf -y install libcld*

git clone https://github.com/coanda/dactl
cd dactl
meson _build
ninja -C _build
ninja -C _build install
mkdir -p /usr/local/lib64/dactl/plugins
mkdir -p /usr/local/share/dactl/
cp data/config/dactl.xml /usr/local/share/dactl/

echo "/usr/local/lib64" >/dev/null | tee -a /etc/ld.so.conf
ldconfig

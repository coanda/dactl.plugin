#!/bin/bash

xdg-icon-resource uninstall --novendor --size "scalable" "dactl"

gtk-update-icon-cache -f -t /usr/share/icons/hicolor

rm -f "/usr/local/lib/pkgconfig/comedi.pc"
rm -f "/usr/share/vala/vapi/comedi.vapi"
rm -f "/usr/include/dactl.h"
rm -f "/usr/lib64/libdactl-1.0.so"
rm -f "/usr/share/glade/catalogs/dactlui.xml"
rm -f "/usr/share/glib-2.0/schemas/org.coanda.dactl.gschema.xml"
rm -f "/usr/bin/dactl"
rm -rf "/usr/lib64/dactl"
rm -rf "/usr/share/doc/dactl"
rm -rf "/usr/share/licenses/dactl"

dnf -y remove libcld*

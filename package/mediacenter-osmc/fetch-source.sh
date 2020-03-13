# (c) 2014-2015 Sam Nazarko
# email@samnazarko.co.uk

#!/bin/bash

if [ "$1" == "" ]; then echo -e "You must specify a build architecture" && exit 1; fi

rm -rf src/

. ../common.sh
if [ "$1" == "rbp1" ] || [ "$1" == "rbp2" ] || [ "$1" == "pc" ] || [ "$1" == "vero2" ] || [ "$1" == "vero3" ]
then
pull_source "https://github.com/xbmc/xbmc/archive/8f9ff4c11f7f8acdf609484d61b82b25f875c21a.tar.gz" "$(pwd)/src"
API_VERSION="18"
else
pull_source "https://github.com/xbmc/xbmc/archive/master.tar.gz" "$(pwd)/kodi"
API_VERSION="19"
fi
if [ $? != 0 ]; then echo -e "Error fetching Kodi source" && exit 1; fi

pushd src/xbmc-*
install_patch "../../patches" "all"
test "$1" == pc && install_patch "../../patches" "pc"
if [ "$1" == "rbp1" ] || [ "$1" == "rbp2" ]
then
	install_patch "../../patches" "rbp"
fi
if [ "$1" == "rbp1" ] || [ "$1" == "rbp2" ] || [ "$1" == "vero2" ] || [ "$1" == "vero3" ]; then install_patch "../../patches" "arm"; fi
test "$1" == vero2 && install_patch "../../patches" "vero2"
test "$1" == vero3 && install_patch "../../patches" "vero3"

teardown_env "${1}"

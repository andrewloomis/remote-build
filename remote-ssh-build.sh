#!/bin/bash

PLATFORM=$1
PROJ_DIR="/home/$USER/dev/glasses"
BUILD_DIR="$PROJ_DIR"/../glasses-build/"$PLATFORM"
mkdir -p "$BUILD_DIR"

if [[ $PLATFORM == 'desktop' ]]
then
        cd "$BUILD_DIR"
	~/Qt/5.12.0/gcc_64/bin/qmake \
                "$PROJ_DIR"/glasses.pro -spec linux-g++ \
                CONFIG+=debug CONFIG+=qml_debug CONFIG+=PLATFORM_DESKTOP \
                && /usr/bin/make qmake_all
        make -j12
elif [[ $PLATFORM == 'arm' ]]
then
        cd "$PROJ_DIR"/glassesDevices
	make -j12
	cd "$BUILD_DIR"
	/home/"$USER"/dev/dragonboard/qt5-qmake/bin/qmake \
                "$PROJ_DIR"/glasses.pro -spec devices/linux-dragonboard \
                CONFIG+=debug CONFIG+=qml_debug CONFIG+=PLATFORM_ARM \
                && /usr/bin/make qmake_all
        make -j12
fi

exit 0


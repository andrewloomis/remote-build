#!/bin/bash

PROJ_DIR=~/dev/glasses
cd "$PROJ_DIR"/glassesDevices
make clean
rm -rf "$PROJ_DIR"/../glasses-build/*

exit 0

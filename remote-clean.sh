#!/bin/bash
SERVER=$1

rm -rf build/*
rm -rf glassesDevices/lib/*
rm glassesDevices/src/*.o
ssh $SERVER "bash -s" -- < remote-ssh-clean.sh

exit 0

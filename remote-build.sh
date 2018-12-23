#!/bin/bash

if [[ $1 == '-h' || $1 == '--help' || $1 == 'help' ]]
then
	echo "Usage"
	echo "remote-build.sh [server-ip] [platform]"
	echo "platforms: desktop | arm"
	exit
fi

PROJ_DIR="~/dev/glasses"
SERVER=$1
PLATFORM=$2
echo "Remote build at $SERVER for platform: $PLATFORM"
echo "Transfering source files"
rsync -avzhe ssh --delete --progress --exclude='*.o' --exclude='*.so' --exclude='*.a' --exclude='build' --exclude='*.user*' * $SERVER:~/dev/glasses
ssh $SERVER "bash -s" -- < remote-ssh-build.sh $PLATFORM

mkdir -p build/"$PLATFORM"
if [[ $PLATFORM == "arm" ]] 
then
	scp $SERVER:~/dev/glasses/glassesDevices/lib/*.so glassesDevices/lib
fi
scp $SERVER:~/dev/glasses-build/"$PLATFORM"/glasses build/"$PLATFORM"

exit 0

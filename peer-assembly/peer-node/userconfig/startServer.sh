#!/bin/bash

ulimit -c unlimited

if [ -e "/state/peer-node" ]; then
  rm -f /state/peer-node
fi

sleep 4

if [ ! -d /data ]; then
  echo "/data directory does not exist"
  exit 1
fi

if [ ! -d /data/00000 ]; then
   echo "nemgen boostrap needs to be run"
   exit 1
fi

if [ ! -f "/data/index.dat" ]; then
  echo "No index.dat file, creating now...."
  echo -ne "\01\0\0\0\0\0\0\0" > /data/index.dat
fi

cd /data
mkdir -p startup
rm -f /data/startup/mongo-initialized
touch /data/startup/datadir-initialized

sleep 4

echo "!!!! Going to start peer node now...."

touch /state/peer-node

exec /usr/catapult/bin/catapult.server /userconfig

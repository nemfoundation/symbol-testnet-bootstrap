#!/bin/bash

ulimit -c unlimited

if [ -e "/state/api-node-0-broker" ]; then
  rm -f /state/api-node-0-broker
fi

cd /data
rm -f /data/startup/datadir-initialized

touch /state/api-node-0-broker

exec /usr/catapult/bin/catapult.broker /userconfig

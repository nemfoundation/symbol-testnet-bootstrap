#!/bin/bash

sudo mv data/00000/00001.dat data/00000/00001.stmt data/00000/hashes.dat /tmp

for dir in data/*; do
    sudo rm -rf $dir
done

mkdir data/00000
sudo mv /tmp/00001.dat /tmp/00001.stmt /tmp/hashes.dat data/00000/

#!/bin/bash
sudo rm -rf data/mongo/*
sudo mv data/api-node/00000/00001.dat data/api-node/00000/00001.stmt data/api-node/00000/hashes.dat /tmp

for dir in data/api-node/*; do
    sudo rm -rf $dir
done

mkdir data/api-node/00000
sudo mv /tmp/00001.dat /tmp/00001.stmt /tmp/hashes.dat data/api-node/00000/

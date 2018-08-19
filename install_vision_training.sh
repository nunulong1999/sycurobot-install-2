#!/bin/bash
echo "Installing tools to train the vision neural network (you need to do this only once)"
./workspace install rhoban/deep_vision
cd src/rhoban/deep_vision
git fetch --tags
git checkout final_2018
ln -s ../../../devel_release/lib/deep_vision/ bin
cd ../../..
make


#!/bin/bash 
sudo apt-get install freeglut3-dev libx11-dev libxrandr-dev libfreetype6-dev
./workspace install rhobandeps/sfml
cd src/rhoban/model
git fetch --tags
git checkout final_2018
cd ../../..
cd src/rhoban/rhio/
git pull
git fetch --tags
git checkout final_2018
cd ../../..
catkin config --profile novision -a --cmake-args -DBUILD_ROBOCUP_VIEWER=ON

#!/usr/bin/env bash

# This script copies necessary file from wintools into your player directory
# to get you started.

echo "------------ WINTOOLS SETUP ------------"

PlayerDir=$HOME/player

if [ ! -e $PlayerDir/vspec ]; then
  mkdir $PlayerDir/vspec
fi

cp *.vspec $PlayerDir/vspec/

for file in Config.pp Config.prc .playerrc
do
  cp $file $PlayerDir/$file
done

echo Setup is finished.

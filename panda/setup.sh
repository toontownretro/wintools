#!/usr/bin/env bash

# This script copies necessary file from wintools into your player directory
# to get you started.

echo "------------ WINTOOLS SETUP ------------"

source cp_vspec.sh

for file in Config.pp Config.prc .playerrc
do
  cp $file ~/
done

echo Setup is finished.

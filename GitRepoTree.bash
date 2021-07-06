#!/bin/bash
#
# Keeps Redisplaying a Directory Tree
# Author Dale Macdonald (2021)

ROOT_FOLDER=./.git/
cd $ROOT_FOLDER

while true
do
	clear
	tree
        echo
	echo Root Folder = $ROOT_FOLDER
	echo Waiting...
	sleep 10
done

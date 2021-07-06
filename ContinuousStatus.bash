#!/bin/bash
#
# Keeps Redisplaying a repo's git status
# Author Dale Macdonald (2021)

ROOT_FOLDER=./
cd $ROOT_FOLDER

while true
do
	clear
	git --no-pager status  
        echo
	echo Root Folder = $ROOT_FOLDER
	echo Waiting...
	sleep 10
done

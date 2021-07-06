#!/bin/bash
#
# Keeps Redisplaying a Pretty Log
# Author Dale Macdonald (2021)

ROOT_FOLDER=./
cd $ROOT_FOLDER

while true
do
	clear
	git --no-pager log --graph --pretty=oneline --abbrev-commit --decorate --all  
        echo
	echo Root Folder = $ROOT_FOLDER
	echo Waiting...
	sleep 10
done





# Keeps Redisplaying a Directory Tree
# Author Dale Macdonald (2018)
@echo off
SET ROOT_FOLDER=.\.git
:loop
	
	cls
	tree %ROOT_FOLDER% /F 
        echo
	echo Root Folder = %ROOT_FOLDER%
	echo Waiting...
	timeout -t 10
goto loop
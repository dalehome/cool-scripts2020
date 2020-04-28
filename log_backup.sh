#!/bin/bash

# Check args and fail fast
if [ $# -lt 2 ] ; then
    echo >&2 "Usage : $0 <source> <storage>"
    exit -1
fi

log_path=$1
storage_dir=$2
tmp_dir=$log_path/tmp_arc
zip_name="${storage_dir}/`date +%Y%m%d_%H%M`.zip"

mkdir -p $tmp_dir
mkdir -p $storage_dir

echo "Moving logs to temp folder"
/usr/bin/find $log_path -name "*" -type f -mtime +1 -exec mv {} $tmp_dir \;

if [ $? == 0 ]; then
	echo "Archiving the logs"
	pushd $tmp_dir > /dev/null
	zip $zip_name *
	if [ $? == 0 ]; then
		popd > /dev/null
		echo "Cleaning temp folder"
		rm -rf $tmp_dir
	else
		echo "Archiving failed!"
	fi
else
	echo "Moving failed!"
fi

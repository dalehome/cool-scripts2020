#!/bin/bash
#
# © Daleman 2018

# HIVE is the number of days before being moved to archive, BLITZ is number of days until deletion from archive
HIVE=${1:-30}
BLITZ=${2:-90}

# Location where logs will get archived

ARCHIVE=/app/log_archive
mkdir -p $ARCHIVE

# Archive log files older than 30 days

mkdir -p /$ARCHIVE/{scheduler_archive,monitor_archive}
find /var/log/pgo/scheduler/ -type f -name '*.log' -mtime +$HIVE -exec mv {} $ARCHIVE/scheduler_archive/ \;
find /var/log/pgo/monitor/ -type f -name '*.log' -mtime +$HIVE -exec mv {} $ARCHIVE/monitor_archive/ \;

# Blitz log files older than 90 days

find $ARCHIVE/scheduler_archive/ -type f -name '*.log' -mtime +$BLITZ -exec rm {} \;
find $ARCHIVE/monitor_archive/ -type f -name '*.log' -mtime +$BLITZ -exec rm {} \;

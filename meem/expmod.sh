#!/bin/sh
# set -x
# BASH base script to change EXPIRATION hours in DMA RADIUS Manager RM_USERS table
# to modify users expiration disconnection time so that middle night disconnection can be avoided
# You can schedule this script to run every XX minutes/hours
# example : in cron use below line , means run at 11:50pm
# 50 23 * * * * /mageek/expmod.sh
################################################
# By Syed Jahanzaib / aacable at hotmail dot com
# edited by TechnoMeeM
################################################

# MYSQL related. MAKE SURE TO CHANGE THESE to MATCH YOUR LOCAL's
SQLUSER="root"
SQLPASS="meem"
export MYSQL_PWD=$SQLPASS
CMD="mysql -uroot -pmeem --skip-column-names -s -e"
DB="radius"
# DMA related, below is 2pm. change timings as per your requirements
DEFAULT_TIME="00:00:00"
NEW_EXP_TIME="14:00:00"
COLUMN_NAME="expiration"
# R.M Table which contain users expiration information (in freeradius, we use Expiration attribute in radcheck,
# But DMA uses its own authentication module to validate users details from the rm_users table
USER_TABLE="rm_users"
# Date Related
DATE=`date`
TODAY=$(date +"%Y-%m-%d")

# Start execution
# Modify the 00:00:00 hours to suite yours local time, I have used 2pm timings as an example
$CMD "use $DB; UPDATE $USER_TABLE SET $COLUMN_NAME = DATE_FORMAT(expiration, '%Y-%m-%d $NEW_EXP_TIME');"

# or you can use single line code here in mysql directly or by $CMD
#UPDATE rm_users SET expiration = DATE_FORMAT(expiration, '%Y-%m-%d $NEW_EXP_TIME');"

# ECHO on screen and also LOG in /var/log/syslog (for ubuntu)
echo "DMASOFTLAB RADIUS MANAGER - User expiration HOURS now changed from $COLUMN_NAME to $NEW_EXP_TIME - Script executed successfully @ $DATE"
logger "DMASOFTLAB RADIUS MANAGER - User expiration HOURS now changed from $COLUMN_NAME to $NEW_EXP_TIME - Script executed successfully @ $DATE"
#Script Ends here

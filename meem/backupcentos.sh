#!/bin/bash
##this script will backup mysql and upload it to google drive
##directory name
dirname=backup;
##database name
database=radius;
##database username
dbuser=root;
##database password
dbpass=meem;
## rclone remote name
rcloneRemoteName=meem;
##google drive folder name
gdrivefoldername=meemradius;
##condition to check folder exist or not
if [ ! -d "$dirname" ]
then
    ##create directory
    mkdir -p /var/www/html/$dirname
    chmod -R a+rwx /var/www/html/$dirname
    ##dump mysql database on server
    mysqldump -u $dbuser -p$dbpass $database | gzip>"/var/www/html/$dirname/$database($(date +\%Y_\%m_\%d_\%H)).sql.gz"
    ##wait for 10 seconds
    sleep 10
    ##upload it to google drive
    rclone copy "/var/www/html/$dirname/$database($(date +\%Y_\%m_\%d_\%H)).sql.gz" $rcloneRemoteName:$gdrivefoldername
    ##if folder already exist
else
    ##dump mysql database on server
    mysqldump -u $dbuser -p$dbpass $database | gzip>"/var/www/html/$dirname/$database($(date +\%Y-\%m-\%d-\%H)).sql.gz"
     ##wait for 10 seconds
    sleep 10
    ##upload it to google drive
    rclone copy "/var/www/html/$dirname/$database($(date +\%Y-\%m-\%d-\%H)).sql.gz" $rcloneRemoteName:$gdrivefoldername
    ##delete 10 days older file on server to save disk space(this command is optional)
    find /var/www/html/$dirname -mtime +10 -type f -delete
fi
exit 0;

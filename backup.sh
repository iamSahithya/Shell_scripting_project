#!/bin/bash
#
#
###########################################
#     Author:Sahithya
#     Date: 03.02.25
###########################################
#
#Setup variables for file names
date_time=$(date +"%d-%m-%y-%H-%M")
date=$(date +"%d-%m-%Y")

#Create acrchive file name
archive_folder="Backup-$date"

#Print start status message
echo "Backing up files from /home/devopsnewbie/Desktop to remote user $archive_folder"

mkdir -p /home/devopsnewbie/Desktop/backup_logs

#Backup files using rsync every half hour i.e 3 mins
rsync -p -aiv /home/devopsnewbie/Desktop/mws4/  ubuntu@44.202.117.153:/home/ubuntu/$archive_folder/ >> /home/devopsnewbie/Desktop/backup_logs/$date_time.log 2>&1

#check if the backup is done properly or not
if [ $? -eq 0 ];then
	echo "Finished Backup successfully on $date_time">>/home/devopsnewbie/Desktop/backup_logs/backup_$date_time.log
else
	echo "Failed to Backup the files on $date_time">>/home/devopsnewbie/Desktop/backup_logs/backup_$date_time.log
	exit 1
fi


This is to explain the code
```
#Setup variables for file names
date_time=$(date +"%d-%m-%y-%H-%M")
date=$(date +"%d-%m-%Y")

#Create acrchive file name
archive_folder="Backup-$date"
```
Created Variables date_time,date,archive folder

```
rsync -p -aiv /home/devopsnewbie/Desktop/mws4/  ubuntu@44.202.117.153:/home/ubuntu/$archive_folder/ >> /home/devopsnewbie/Desktop/backup_logs/$date_time.log 2>&1
```
``` rsync``` is used to synchronize files and directories between two hosts<br>
``` -p ``` --perms, -p to preserve permissions<br>
``` -aiv``` <b>-a</b>--archive, -a archive mode is -rlptgoD (no -A,-X,-U,-N,-H); <b>-i</b>--itemize-changes, -i output a change-summary for all updates; <b>-v</b>--verbose, -v increase verbosity<br>
``` /home/devopsnewbie/Desktop/mws4/``` folder to be backed up.<br>
``` ubuntu@44.202.117.153:/home/ubuntu/$archive_folder/``` ubuntu@44.202.117.153 is username@remotehost; : is separator; /home/ubuntu/$archive_folder/ archive folder example Backup-03-02-2025 is created 
and in which backup files are stored.<br>
``` >> /home/devopsnewbie/Desktop/backup_logs/$date_time.log 2>&1``` It is to output the message of rsyn command to log in backup_logs. 2>&1 it is to redirect any error message and standard output to the $date_time.log
<br>

```
if [ $? -eq 0 ];then
	echo "Finished Backup successfully on $date_time">>/home/devopsnewbie/Desktop/backup_logs/backup_$date_time.log
else
	echo "Failed to Backup the files on $date_time">>/home/devopsnewbie/Desktop/backup_logs/backup_$date_time.log
	exit 1
fi
```
it is to check if exit code is 0 i.e if rsync backed up files successfully exit code will be 0. so if it is backed up successfully it will return the status meesage "Finished Backup successfully on $date_time" to 
backup_$date_time.log<br>
if it fails it returns the status message "Failed to Backup the files on $date_time" to backup_$date_time.log<br>


1. You need to set up the communication between the local machine and remote host from root directory ``` cd ~/.ssh```; ``` ssh-keygen```; enter details if you want else click <i>"Enter"</i><br>
2. now cat keyname.pub and you will get the public key and copy that.<br>
3. In remote server also use ``` ssh-keygen```; ``` vim authorized_keys```; paste the public key you copied from your local machine and save it<br>
4. then once the setup is done you can do ```ssh username@privateipaddressofremotehost ```.<b><i> This way you'll set the communication between your local machine and remote server</i></b><br>
5. Now save this file as backup.sh<br>
6. Next you need to create a cronjob<br>
     a. crontab -e to open the crontab editior.<br>
     b. I created a cronjob that runs every 3 mins, at a specific time like 09:32 etc<br>
     c. enter the cron job and click Ctrl+O to get the cron job name, click enter so the name gets saved and click Ctrl+X to exit the crontab editor.<br>

here's a snippet of how the backup files are created on remote host
![s3](https://github.com/user-attachments/assets/072e6785-ec06-436e-b9c2-3826fc5d350a)










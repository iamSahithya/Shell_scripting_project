# Shell_scripting_project
Shell Scripting Project<br>

This Project idea was taken from chatgpt and implemented on my own.<br>

Backup Script:<br>
Objective: Create a script that automates the process of backing up files or directories to a remote server or a local backup folder.<br>
Skills Used: File handling, conditional logic, rsync, scheduling (via cron), and logging.<br>
Features:<br>
1. Backup files to a remote server using rsync or SCP.<br>
2. Check if backup has completed successfully (via exit codes).<br>
3. Automate backups using cron jobs.<br>
4. Keep backup logs and notifications in case of failure.<br>

So to approach this<br>
Step 1: Firstly from the Features understand what is rsync or SCP. how does they work with examples.<br>
Step 2: Understand cronjobs concept clearly and how they can be used to backup<br>
Step 3: Understand exit codes<br>
Step 4: Understand backup logs concept on how to take all the errors into logs.<br>

<b>Step-1: rsync or SCP </b><br>
1) rsync or remote synchronization is a software utility for Unix-Like systems that efficiently sync files and directories between two hosts or machines.<br>
2) One is the source or the local-host from which the files will be synced, the other is the remote-host, on which synchronization will take place.<br>
3) There are basically two ways in which rsync can copy/sync data:<br>
    a) Copying/syncing to/from another host over any remote shell like ssh, rsh.This uses ':'after a hostname<br>
    b) Copying/Syncing through rsync daemon using TCP.This uses '::' after a hostname<br>
4)  Rsync is widely used for backups and mirroring and as an improved copy command for everyday use.
5)  Some of the additional features of rsync are:

       o      support for copying links, devices, owners, groups, and permissions

       o      exclude and exclude-from options similar to GNU tar

       o      a CVS exclude mode for ignoring the same files that CVS would ignore

       o      can use any transparent remote shell, including ssh or rsh

       o      does not require super-user privileges

       o      pipelining of file transfers to minimize latency costs

       o      support for anonymous or authenticated rsync daemons (ideal for mirroring)
6)  <b> Note that rsync must be installed on both the source and destination machines. </b>
7)  An rsync daemon allows you to set up a server that listens for incoming rsync requests and handles file transfers directly. via TCP
Example:
```sh
rsync -avz file1.txt user@remote_host:/home/user/backup/
```
hear to transfer file1.txt from local machine to remote_host remote directory /home/user/backup<br>
```sh
rsync -avz /home/user/data/ user@remote_host:/home/user/backup/
```
To sync a local directory (/home/user/data/) with a remote directory (/home/user/backup/), The trailing / on data/ means the contents of data will be copied to the backup directory, not the data directory itself.<br>
```sh
rsync -avz -e "ssh -p 2222" /home/user/data/ user@remote_host:/home/user/backup/
```
If the remote server is running rsync over a specific port (other than the default SSH port 22), you can specify the port with the -e option.<br>

<b>Exit Codes: </b><br>
In shell scripting, exit codes (also called exit status or return codes) are used to indicate whether a command or script has completed successfully or if an error occurred. An exit code is a numeric value returned by a command when it finishes executing.<br>

Basic Concept:<br>
1. Exit Code 0: Indicates success. The command or script completed successfully without any issues.<br>
2. Exit Code Non-zero (1-255): Indicates failure. The command or script encountered an error. Different non-zero values can represent different types of errors, depending on the program or script.<br>
3. After running a command in a shell script, you can check its exit code using the special variable $?
4. set -e: Automatically exits the script when any command fails (non-zero exit code).

To redirect the errors/failures we can use 2>&1 which is to redirect output in case of stdout and stderr
Redirect both stdout and stderr to the same file:
```sh
command > all_output.txt 2>&1
```
1. <b> > all_output.txt:</b> Redirects stdout to all_output.txt.
2. <b>2>&1:</b> Redirects stderr (<i>file descriptor 2</i>) to stdout (<i>file descriptor 1</i>), so both streams go to all_output.txt.


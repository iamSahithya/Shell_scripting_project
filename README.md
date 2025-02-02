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



# 01.03. Wednesday

First Task: 
- create files and write something in them with vi and nano and use cat to look into the file

Second Task: 
- grep command
- sed command
- awk '{print NR,$1,$3}' employee.txt  
- sed 's/regex/string/g' example.txt

## Managing Processes
- process = sequence of tasks
- proccesses are started based on a program you start
    - the processes support your program operation
    - processes are allocated a process ID number (PID) when they start
- common commands
    - ps #shows snapshot of all running processes
    - pstree #shows snapshot in treeform
        - parent process > fork() -> child process > fork() -> child...
        - has to be installed. mac: "brew install pstree"
    - pidof
        - find the PID of a process by the process name
        - has to be installed. mac: "brew install pidof"
    - top
        - dynamic overview of running processes showing usage of cpu, memory, running time etc.
            - us - time spent running proccesses in user space
            - sy - time spent running kernal space processes
            - id - idle time
            - wa - time spent waiting for I/O to complete
            - hi - time spent handling hardware issues
            - si - time spent handling software issues
            - st - time lost waiting for other CPU processes to complete
        - exit with "control+c"
- process states
    - start>ready>running>stopped 
    - the process can run in cycle of ready>running>waiting>ready... until it is stopped

### Managing zombie processes
- kill <-numberbelow> processID 
    - -9 sigkill >will stop the process without a graceful exit
    - -15 sigterm >exit without immediatly terminating 
    - -19 sigstop >pause the process

### Nice and Renice commands
nice <numberbelow> processID/bashfile
- nice >launch programs with priority
- renice >change priority of already running process
- values range from -20 (most favorable to the process) to 19 (least favorable to the process)

### Jobs
- fg%jobnumber - moves running job to the foreground/shell screen
- bg%jobnumber - moves running job to the background
- bg [job process no/id] to run in background
- gg [job process no/id] to run in foreground

### AT vs CRON
- "at" command is used to run a job once at a specific time 
- "cron" command is used to run a job at regular intervals
    - Crontab
    - cron table has list of commands for job schedule

![Bild](https://repository-images.githubusercontent.com/315506670/165edd80-9127-11eb-9f0d-705588cbb3dd)

## Managing Services
- we will work more with services than processes
- for http there is httpd
- for ssh there is sshd
- services have to be running in order to be able to use the corresponding commands. like sshd has to running in the background so that you are able to use the ssh command
- provide functionality for different things such as networking, admin and security

### some common commands
- managing and monitoring services
    - systemctl (has various subcommands - status, start, stop, restart, enable, disable)
        - service sshd start [ubuntu]
        - systemctl start sshd.service [centos7, amazon linux2]

## Additional System Performance Info commands
- lscpu > lists CPU information
- lshw > lists hardware
- du > checks file and dir sizes
- df > display disk size and free space
- uptime > how long the system has been up and users
- free > shows use of physical memory
- vmstart > starts virtual memory
- fdisk > godifies partitions in the hard drive

## Amazon Cloudwatch
- dashboard to monitor all your aws services
    - e.g. load on EC2s
    - system health of EC2 instances and other AWS infrastructure
- get SNS notifications if setup 

## Linux bash shell
### Features
- interpret commands
- shell scripts run here
- interacts with operating system

### shell variables
- used to store values such as numbers/integers, special characters, 'strings'
- eg. name = value; studentname = Jasmin; num = 1
- Rules:
    - Best Practice: reasonable or useful names should be used
    - cannot have spaces (you can use _ instead)
    - don't start variable names with special characters (/,&,%)

### enviroment variables
- echo
    - echo $USER > outputs the username to screen
    - echo $HOME > home directory of user is displayed /home/
    - echo $SHELL > /bin/bash or /bin/zsh (Folder of your Terminal)
    - echo $PATH
- env > show all available variables for your system 

### Alias
- you can create an alias which then acts as the comment you want it to
- e.g. alias ||='ls -l' ; unalias || (NO SPACES ALLOWED BETWEEN = AND VARIABLES)
- aliases are stored 

### Bash shell scripts/scripting
- common tasks which you can "automate" with scripts
- basic commands of shell scripts
- logical statements

### What is a script
- set of commands in a file
- useful for setting up workflows
- helps ease repetition 
- can use a cron job to run a script
- can reduce human errors

Example "Backup.sh":
```
#!/bin/bash (Scripts always start with #! "shebang")
#script to backup the home directory
tar -cf backup home.tar $USER/Downloads 
echo "Backup job complete at 'date'"    
```

### To run a script effectively
- Bash shell scripts are text files with .sh extension
    - create the script using text editor
- set the script permissions to run
    - chmod u+x Backup.sh   
- use ./ to run the script

Example User Data script on EC2:
```
#!/bin/bash 
#Author: ...
#Date: ...
#How to Use: ...
#Script version: ...
yum update -y
yum install httpd -y
cd /var/www/html
echo 'hello from Yassin' > index.html
service httpd start
chkconfig httpd on
```

### Conditional Statements
- you can use conditional statements in your script
    - if statements
    - if then
    - if then else
    - if then elif then else
```
#!/bin/bash
#copy file1 to /tmp script
#thendele file 1 if copy succeeds
if[cp file1 /tmp];
then 
   rm file1
```
- comparison operators
    - ea "equal"
    - ne "not equal"
    - gt "greater than"
    - ge "greater equal"
    - lt "less than"
    - le "less equal"
    - >
    - <
    - >=
- loop statements
    - used too make parts of a script repeat themselves 
        - until condition is met (for statement)
        - specific number of repetitions (until statement)
        - while a condition is true (while statement)


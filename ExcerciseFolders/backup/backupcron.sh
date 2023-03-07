#!/bin/bash
#checks if there is a backup.tar in specified folder.
#If not it creates one with all the contents (tar -cvf). 
#If there already is one it will only update the backup.tar with any new files (tar -uvf)
if [ -f /Users/yassin/NeueFische/Git-Excercise/ExcerciseFolders/backup.tar ]; then 
    tar -uvf /Users/yassin/NeueFische/Git-Excercise/ExcerciseFolders/backup/backup.tar /Users/yassin/NeueFische/Git-Excercise/ExcerciseFolders/crontab/
else
    tar -cvf /Users/yassin/NeueFische/Git-Excercise/ExcerciseFolders/backup/backup.tar /Users/yassin/NeueFische/Git-Excercise/ExcerciseFolders/crontab/
fi
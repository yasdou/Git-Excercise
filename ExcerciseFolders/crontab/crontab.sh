#!/bin/bash

# First line: ls lists all files in the folder. "wc -l" counts how many lines were listed. 
#This number then gets put into the variable i
i=$(find *.txt | sed -e 's/[^0-9]*//g' | tail -n 1)
#Since we want a new file with a higher number than before we add 1
i=$(($i+1))
#touch creates a new file in specified directory with index i
touch /Users/yassin/NeueFische/Git-Excercise/ExcerciseFolders/crontab/file_date$i.txt
#Just for fun I write the date and time when it was created into the file£#
date > /Users/yassin/NeueFische/Git-Excercise/ExcerciseFolders/crontab/file_date$i.txt
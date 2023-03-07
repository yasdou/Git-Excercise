#!/bin/bash
#auto generate new files everytime the script is run

#listing all files with ls and then counting how many were listed with wc 
if [ "$(ls /Users/yassin/NeueFische/Git-Excercise/ExcerciseFolders/LAB235/)" ]; then
    i=$(find /Users/yassin/NeueFische/Git-Excercise/ExcerciseFolders/LAB235/ -type f -name '*' | sed 's|.*/||' | sed -e 's/[^0-9]*//g' | sort -n | tail -n 1)
else
    i=0
fi
#x is i+25 so that it creates 25 new files
echo $i
x=$(($i+25))
echo $x
#while loop runs as long as i is lower than x
#everytime the loop begins i is incremented by 1
while [ $i -lt $x ]
do
    i=$(($i+1))
    #touch creates the new file
    touch /Users/yassin/NeueFische/Git-Excercise/ExcerciseFolders/LAB235/yassin$i
    #echo just gives back the new filename. this is not needed for the script
    echo "Created file yassin$i"
    
done
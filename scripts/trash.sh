#!/bin/sh                                                                                       
# rm.sh: move to trash box                                                                      
while [ `echo $1 | grep "^-"` ]
do
    shift
done

if [ $# -eq 0 ];then
    echo "rm.sh: usage: rm file ..."
    exit 1
fi

for file in $@
do
    if [ ! -e $file ];then
        echo "rm.sh: rm: $file: No such file or directory"
        exit 1
    fi
done

todir=~/.Trash/`date +trash%s`/
echo "rm.sh: $@ -> $todir"
mkdir $todir
mv $@ $todir

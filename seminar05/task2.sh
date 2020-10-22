#!/bin/bash
a=$1
b=$2

git log --pretty=format:"%H" >> hash.txt
git log --pretty=format:"%s" >> text.txt

l=0
r=0

i=0
while read hash; do
    if [ "$hash" == "$a" ]; then
        l=$i
    fi

    if [ "$hash" == "$b" ]; then
        r=$i
    fi
        
    i=$((i+1))
done < hash.txt

i=0
while read line; do
    if [[ $l -le $i  ]]; then
        if [[ $i -le $r ]]; then
            echo "$line"
        fi
    fi

    (( i++ ))
done < text.txt


rm hash.txt
rm text.txt
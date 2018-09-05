#! /bin/bash


# open dash://php:{query}

if [ $# == 1 ]
then
    open dash://$1
elif [ $# == 0 ]
then
    open dash://
else
    open dash://$1:$2
fi

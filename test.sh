#! /bin/bash

STR="Hello world"
echo $STR

PART=$(ls | wc -l)

echo $PART

PART=$(($PART+1))
echo $PART

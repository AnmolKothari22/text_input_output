#!/bin/bash

if [ -z "$1" ]; then
	echo -e "\033[0;31mTERMINATED\033[0m"
	echo "give arguments please..."
	echo "Usage: ./executer <filename>.cpp"
    	exit 1
fi

len1=${#1}
if [ "$len1" -lt 5 ];then
	echo -e "\033[0;31mNOT EXECUTING , give correct filename\033[0m"
	exit 1
fi

FILE="$1"
TILL=$(($len1-4))
FILENAME="${FILE:0:$TILL}"
len2=${#FILENAME}
#echo $FILENAME
EXTENSION="${FILE:$((len2)):len1}"

#echo $EXTENSION

if [ $EXTENSION != ".cpp" ];then
	echo -e "\033[0;31mIncorrect extention\033[0m"
	echo "your extension was $EXTENSION but this program only works for .cpp"
	exit 1
fi

if [ $# -gt 1 ];then
	argu=" "
	for ((i=1; i<=$#; i++))
	do
    	#echo "${!i}"
		if [ $i -ne 1 ];then
		argu+=" ${!i}"
		fi
	done
	python3 tex.py $argu > inputer2.txt

	g++ "$FILE" -o "$FILENAME".exe
	TEM=$( { time ./"$FILENAME".exe < inputer2.txt > outer.txt; } 2>&1 | awk '/^user/ {print $2}' )
	echo time taken in execution : $TEM
	exit
fi


g++ "$FILE" -o "$FILENAME".exe
TEM=$( { time ./"$FILENAME".exe < inputer.txt > outer.txt; } 2>&1 | awk '/^user/ {print $2}' )
echo time taken in execution : $TEM





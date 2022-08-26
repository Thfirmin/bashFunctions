#!/bin/bash

# Requeriments:
# Vim [Vi Improved] editor & 42Header vim plugin

echo "What's the name of header (without \".h\")? "
read NAME

if [ $(ls ${NAME}.h 2> /dev/null) ]; then
	echo "There's already exist a ${NAME}.h, you want to Override the current ${NAME}.h? [Y\n]: "
	read ANSWER
	if [[ $ANSWER == "n" ]]; then
		return 1
	else
		rm -rf ${NAME}.h
	fi	
fi

echo "#ifndef ${NAME^^}_H" >> ${NAME}.h
echo -e "# define ${NAME^^}_H\n" >> ${NAME}.h

echo "You want to put folder in your {NAME}.h file ? [Y\n]: "
read ANSWER

if [[ $ANSWER != "n" ]]; then
	for ((; ;)); do
		echo "What's the folder name you want to put? "
			read FOLDER
		echo "/* -.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-' -.-'-.-'-.-'-.-'-.-'-.-'-.-'" >> ${NAME}.h
		echo -e "** =o=><§{ ${FOLDER} }§>\n*/\n" >> ${NAME}.h
		echo "You want to put another folder? [Y\n]: "
			read ANSWER
		if [[ $ANSWER == "n" ]]; then
			break
		fi
	done 
fi

echo "#endif" >> ${NAME}.h
vim -c Stdheader -c w ${NAME}.h
return 0


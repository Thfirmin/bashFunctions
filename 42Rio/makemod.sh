#!/bin/bash

makemod()
{

	let LEN=78
	STR=y
	let ITERATIVE
	let STD_FUNC
	let	FOLDER
	let ANSWER
	let HELP

	function iterflag
	{
		FLAG=$2
		ARGV=$1
		LEN_ARGV=${#ARGV}

		if [[ ${ARGV:0:1} == "-" ]]; then
			for ((i = 1; i < $LEN_ARGV; i++)); do
				if [[ ${ARGV:$i:1} == $FLAG ]]; then
					return 1
				fi
			done
		fi
		return 0
	}

	function middle
	{
    	STR_LEN=${#STR}

    	for ((i = 0; i < $LEN; i++)); do
    	    if [[ $i == $(($((LEN / 2)) - $((STR_LEN / 2)))) ]]; then
    	        echo -n $STR
    	    else
    	        echo -n " "
    	    fi
    	done
    	echo ""
	}

	function stdFunctions
	{
		echo -e "all:\t\$(NAME)\n" >> Makefile
		echo -e "\$(NAME):\n" >> Makefile
		echo -e "clean:\n" >> Makefile
		echo -e "fclean:\tclean\n" >> Makefile
		echo -e "re:\t\tfclean all\n" >> Makefile
		echo -en ".PHONY:\tall clean fclean re" >> Makefile
	}

	function initMake
	{
		if [[ $STD_FUNC == 1 ]]; then
			stdFunctions
		fi
		touch Makefile
		vim -c Stdheader -c write Makefile
	}

	iterflag $1 i
	ITERATIVE=$?
	iterflag $1 s
	STD_FUNC=$?
	iterflag $1 f
	FOLDER=$?
	iterflag $1 h
	HELP=$?

	if [[ $HELP == 1 ]]; then
		echo -e "|MAKEMOD|\nA Simple 42 adapted generator of makefile.\n\nCommands:"
		echo -e "-h\tPrint the help of makemod"
		echo -e "-i\tEnable the iterative mod"
		echo -e "-f\tEnable the folder making mod"
		echo -e "-s\tEnable standard Makefile functions"
		echo -e "\nAll options're Desable for default"
		echo -e "\n\nMakemod Function: Created by Thiago Firmino dos Santos (ツキミチチノ)"
		return 0
	fi
	
	if [ $(ls Makefile 2> /dev/null) ]; then
		echo "There's already exist a Makefile, you want to Override the current Makefile? [Y\n]: "
		read ANSWER
		if [[ $ANSWER != "n" && $ANSWER != "N" ]]; then
			rm -rf Makefile
		else
			return 1
		fi	
	fi

	if [[ $ITERATIVE == 1 ]]; then
		echo -n "You Want to Put Folders in your MAkefile? [Y/n] "
		read ANSWER
		if [[ $ANSWER != "n" && $ANSWER != "N" ]]; then
			FOLDER=1
		else
			FOLDER=0
		fi
		echo -n "You want to put the standarts functions of Makefile? [Y/n] "
		read ANSWER
		if [[ $ANSWER != "n" && $ANSWER != "N" ]]; then
			STD_FUNC=1
		else
			STD_FUNC=0
		fi
	fi
	
	if [[ $FOLDER == 1 ]]; then
		for ((; ;)); do
			echo -n "Which folder do you want to insert? "
			read STR
			echo -en "# '-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'-.-'#\n# " >> Makefile
			middle
			echo ""
			echo -n "Do you want to put more folders? [Y/n] "
			read ANSWER
			if [[ $ANSWER != "n" && $ANSWER != "N" ]]; then
				break
			fi
		done
	fi

	initMake

	return 0
}

makemod $1
RET=$?
exit $RET

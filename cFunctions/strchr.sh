# **************************************************************************** #
#                                                                              #
#                                                   ::::::::::: ::::::::::     #
#    strchr.sh                                         :+:     :+:             #
#                                                     +:+     +:+              #
#    By: Thinotsuki <thinotsukimichi@gmail.com>      +#+     :#::+::#          #
#                                                   +#+     +#+                #
#    Created: 2022/08/25 22:56:38 by Thinotsuki    #+#     #+#                 #
#    Updated: 2022/08/25 22:56:40 by Thinotsuki   ###     ###.br               #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

echo -n "Put the String: "
read STR

echo -n "Put the char to compare: "
read SET

let LEN=${#STR}

# ${string:position:lenght} return a substring of a string
for ((i = 0; i < $LEN; i++)); do
	if [[ ${STR:$i:1} == $SET ]]; then
		echo "Founded"
		exit 0
	fi	
done

echo "Not founded"
exit 2

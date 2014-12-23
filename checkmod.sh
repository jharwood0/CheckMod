#!/bin/bash
# Programmed By Josh Harwood


#converting to 3 bit binary
D2B=({0..1}{0..1}{0..1})

# check for a number
if [ -z $1 ]
then
	echo "Usage: $0 <chmod value>" >&2; exit 1
fi

# check if it's a number
re='^[0-9]+$'
if ! [[ $1 =~ $re ]]
then
	echo "error: Not a number" >&2; exit 1
fi

# check if it is a valid chmod value 
if [ ${#1} != 3 ]
then
	echo "not Valid!" >&2; exit 1
fi

# final validity check
if [ "${1:0:1}" -gt 7 ] || [ "${1:1:1}" -gt 7 ] || [ "${1:2:1}" -gt 7 ]
then
	echo "Invalid chmod value" >&2; exit 1
fi
#X--
first=${1:0:1}
#-X-
second=${1:1:1}
#--X
third=${1:2:1}

#split those numbers into their binary form
first=${D2B[$first]}
second=${D2B[$second]}
third=${D2B[$third]}

#for formatting:
underline=`tput smul`
nounderline=`tput rmul`
bold=`tput bold`
normal=`tput sgr0`

#create table with binary outputted
echo -e "\t|\t${bold}Read${normal}\t|\t${bold}Write${normal}\t|\t${bold}Execute${normal}\t|"
echo -e "${bold}Owner${normal} \t|\t${first:0:1}\t|\t${first:1:1}\t|\t${first:2:1}\t|"
echo -e "${bold}Group${normal} \t|\t${second:0:1}\t|\t${second:1:1}\t|\t${second:2:1}\t|"
echo -e "${bold}Other${normal} \t|\t${third:0:1}\t|\t${third:1:1}\t|\t${third:2:1}\t|"

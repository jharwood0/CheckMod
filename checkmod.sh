#!/bin/bash
# Josh Harwood

#converting to 3 bit binary
D2B=({0..1}{0..1}{0..1})

# check for an argument
if [ -z $1 ]
then
	printf "Usage: $0 <chmod value>\n" >&2; exit 1
fi

# check if it's a number
re='^[0-9]+$'
if ! [[ $1 =~ $re ]]
then
	printf "error: Not a number\n" >&2; exit 1
fi

# check if it is a valid chmod value 
if [ ${#1} != 3 ]
then
	printf "not Valid!\n" >&2; exit 1
fi

# final validity check
if [ "${1:0:1}" -gt 7 ] || [ "${1:1:1}" -gt 7 ] || [ "${1:2:1}" -gt 7 ]
then
	printf "Invalid chmod value\n" >&2; exit 1
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

#printf table
divider===============================
divider=$divider$divider

header="\n %12s %7s %9s\n"
format="%0s %5s %7s %7s\n"

width=33

printf "$header" "Read" "Write" "Execute"
printf "%$width.${width}s\n" "$divider"

printf "$format" \
Owner ${first:0:1} ${first:1:1} ${first:2:1} \
Group ${second:0:1} ${second:1:1} ${second:2:1} \
Other ${third:0:1} ${third:1:1} ${third:2:1} 
printf "\n"

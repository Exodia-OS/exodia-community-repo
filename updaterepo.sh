#!/bin/bash

#
# Copyright (C) 2022 Mahmoud Mohamed (00xWolf)  <https://github.com/mmsaeed509>
# LICENSE © GNU-GPL3
#

# a simple script to updating repo database #

## ------------ COLORS ------------ ##

# Reset #
Color_Off='\033[0m' # Text Reset

# Regular Colors #
Black='\033[0;30m'  Red='\033[0;31m'     Green='\033[0;32m'  Yellow='\033[0;33m'
Blue='\033[0;34m'   Purple='\033[0;35m'  Cyan='\033[0;36m'   White='\033[0;37m'

# Bold #
BBlack='\033[1;30m' BRed='\033[1;31m'    BGreen='\033[1;32m' BYellow='\033[1;33m'
BBlue='\033[1;34m'  BPurple='\033[1;35m' BCyan='\033[1;36m'  BWhite='\033[1;37m'

# Underline #
UBlack='\033[4;30m' URed='\033[4;31m'    UGreen='\033[4;32m' UYellow='\033[4;33m'
UBlue='\033[4;34m'  UPurple='\033[4;35m' UCyan='\033[4;36m'  UWhite='\033[4;37m'

# Background #
On_Black='\033[40m' On_Red='\033[41m'    On_Green='\033[42m' On_Yellow='\033[43m'
On_Blue='\033[44m'  On_Purple='\033[45m' On_Cyan='\033[46m'  On_White='\033[47m'

# go to PKGs dir 
cd x86_64

echo -e ""
echo -e "${BCyan}####################################${Color_Off}"
echo -e "${BCyan}#      updating repo database      #${Color_Off}"
echo -e "${BCyan}####################################${Color_Off}"

# old files to be removed! #
declare -a OLD_DATABASE=(
						
						 'exodia-community-repo.db'
						 'exodia-community-repo.db.tar.gz'
						 'exodia-community-repo.db.tar.gz.old'
						 'exodia-community-repo.files'
						 'exodia-community-repo.files.tar.gz'
						 'exodia-community-repo.files.tar.gz.old'
						
						)

echo -e "${BRed}\n[*] removing old files...\n${Color_Off}"

#  #
for i in ${OLD_DATABASE[@]}; do

	rm $i

done

# add all packages to database  #
echo -e "${BRed}\n[+] updating pacman database...\n${Color_Off}"

repo-add exodia-community-repo.db.tar.gz *.pkg.tar.zst

# remove syslink to avoid any issues #
echo -e "${BRed}\n[+] removing syslink to avoid any issues...\n${Color_Off}"

rm exodia-community-repo.db exodia-community-repo.files

mv exodia-community-repo.db.tar.gz exodia-community-repo.db

mv exodia-community-repo.files.tar.gz exodia-community-repo.files

# D O N E! #
echo -e "\n${BGreen}[✔] D O N E \n${Color_Off}"


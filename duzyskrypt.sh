#!/bin/bash
# Author           : Tomasz Krezymon ( tomekkrezymon@gmail.com )
# Created On       : 10.05.2022
# Last Modified By : Tomasz Krezymon ( tomekkrezymon@gmail.com )
# Last Modified On : 12.05.2022
# Version          : v0.03
#
# Description      :
# Opis
#
# Licensed under GPL (see /usr/share/common-licenses/GPL for more details
# or contact # the Free Software Foundation for a copy)


. variables.rc #stale zmienne
. pack.sh #funkcje dot. pakowania
. unpack.sh #funkcje dot. rozpakowywania
. opts.sh
while getopts "hva" OPT; do
	case $OPT in
		h) help; ;;
		v) version; ;;
		a) author; ;;
		*) echo "brak funkcji";;
	esac
	exit
done

CHOICES=$(dialog --keep-tite --menu "Wybierz opcje:" 30 30 30 "${MENU_OPTS[@]}" 2>&1 >/dev/tty)
if [ $? -eq 1 ]; then
    clear
    exit
fi
for CHOICE in $CHOICES
do
    case $CHOICE in
        1)
            packMenu 
            ;;
        2)
            unpackMenu
            ;; 
        3)
            clear
            break 
            ;;
    esac
done


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


CHOICES=$(dialog --keep-tite --menu "Select option:" 30 30 30 "${MENU_OPTS[@]}" 2>&1 >/dev/tty)

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
            break 
            ;;
    esac
done


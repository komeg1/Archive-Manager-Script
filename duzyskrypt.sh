#!/bin/bash
#Author: Tomasz Krezymon
#Created On: 05.05.2022
#Version: 0.1
#Description:
#Pakowanie i rozpakowywanie plików w dialogu.


. variables.rc #stale zmienne
. pack.sh #funkcje dot. pakowania
. unpack.sh #funkcje dot. rozpakowywania


cmd=(dialog --keep-tite --menu "Select options:" 30 30 30)

CHOICES=$("${cmd[@]}" "${MENU_OPTS[@]}" 2>&1 >/dev/tty)

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


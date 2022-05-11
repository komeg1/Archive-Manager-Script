unpackMenu(){
    UNPACK_CHOICES=$(dialog --keep-tite --menu "Select option:" 30 30 30 "${UNPACK_OPTS[@]}" 2>&1 >/dev/tty)
    
    case $CHOICE in
        1)
            createNewDir 
            ;;
        2)
            chooseDir
            ;;
    esac
}

createNewDir(){
    clear
    NEW_DIR_NAME=$(dialog --stdout --inputbox "Podaj nazwe nowego archiwum" 0 0)
    mkdir $NEW_DIR_NAME
    DIR_NAME=$NEW_DIR_NAME
    unpack
}

chooseDir(){
    clear
    DIR_NAME=$(dialog --stdout --dselect . 0 0)
    unpack
}

unpack(){
    FILE= PLIK=$(dialog --stdout --ok-button "DODAJ" --cancel-button "WYPAKUJ" --fselect ./ 0 0 0)	
}


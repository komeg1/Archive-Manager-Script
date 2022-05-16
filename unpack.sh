unpackMenu(){
    clear
    UNPACK_CHOICE=$(dialog --keep-tite --menu "Select option:" 30 30 30 "${UNPACK_OPTS[@]}" 2>&1 >/dev/tty)
    if [ $? -eq 1 ]; then
        ./duzyskrypt.sh
        fi
    case $UNPACK_CHOICE in
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
    NEW_DIR_NAME=$(dialog --stdout --inputbox "Input archive name" 0 0)
    if [ $? -eq 1 ]; then
        unpackMenu
    fi
    mkdir $NEW_DIR_NAME
    DIR_NAME=$NEW_DIR_NAME
    unpack
}

chooseDir(){
    clear
   
    DIR_NAME=$(dialog --stdout --dselect /home/ 0 0)
     if [ $? -eq 1 ]; then
        unpackMenu
    fi
    unpack
}
findExtension(){
    
    DOTS_COUNTER=$(echo $FILENAME | grep -o "\." | wc -l)
    if [ $DOTS_COUNTER -eq 1 ]; then
        EXT=$(echo $FILENAME | cut -d "." -f 2)
    elif [ $DOTS_COUNTER -eq 2 ]; then
        EXT=$(echo $FILENAME | cut -d "." -f 3)
        FILENAME2=$(echo $FILENAME | cut -d "." -f 1)
        EXT2=$(echo $FILENAME | cut -d "." -f 2)

    else
        ERR=$(dialog --stdout --msgbox "Wrong archive" 30 30)
        unpack
    fi
}

unpack(){
    FILE=$(dialog --stdout --ok-button "UNPACK" --cancel-button "" --fselect ./ 0 0 0)	
    FILENAME=$(basename $FILE)
    findExtension
    case $EXT in
    "zip")
		unpackZip
		;;
    "rar")
        unpackRar
		;;
    "tar")
    	unpackTar
		;;
	"gz")
    	unpackGz
		;;
		"bz2")
        unpackBz2
		;;
    esac
    ALERT=$(dialog --stdout --msgbox "Unpacked properly to $DIR_NAME" 30 30)
    ./duzyskrypt.sh
}

unpackZip(){
    unzip $FILENAME -d $DIR_NAME
}
unpackRar(){
    rar x $FILENAME $DIR_NAME
}
unpackTar(){
    tar -xf $FILENAME -C $DIR_NAME
}
unpackGz(){
    gzip -d $FILENAME
    tar -xvzf $FILENAME2.$EXT2 -C $DIR_NAME
    rm $FILENAME2.$EXT2
}
unpackBz2(){
    bzip2 -d $FILENAME
    tar -xvzf $FILENAME2.$EXT2 -C $DIR_NAME
    rm $FILENAME2.$EXT2
}



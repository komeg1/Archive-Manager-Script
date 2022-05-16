
packMenu(){
	FILE=$(dialog --stdout --ok-button "ADD" --cancel-button "CREATE" --fselect ./ 0 0 0)
	if [ $? -eq 0 ]; then
		
		if [ $FILE == "./" ]; then
			ERR=$(dialog --stdout --ok-button "Back" --msgbox "Can't add \""$FILE"\"" 8 30)
			if [ $? -eq 0 ]; then
				packMenu
			fi
		fi
		FILE_LIST+=($FILE)
		packMenu
		
	else
		if [ ${#FILE_LIST[@]} -gt 0 ]; then
			
			chooseExtension
		else
			clear
			ERR=$(dialog --stdout --ok-button "Back" --msgbox "Did not choose any file" 8 30)
			if [ $? -eq 0 ]; then
				packMenu
			fi
			
		fi
	fi
}

getArchiveName(){
	clear
	DIR_NAME=$(dialog --stdout --inputbox "Podaj nazwe archiwum" 0 0)
}

chooseExtension(){
	clear
	EXT_CHOICE=$(dialog --keep-tite --menu "Wybierz rozszerzenie:" 30 30 30 "${EXT_OPTS[@]}" 2>&1 >/dev/tty)
    case $EXT_CHOICE in
        1)
			EXT="zip"
			;;
        2)
           EXT="rar"
		   ;;
        3)
    	   EXT="tar"
		   ;;
		4)
    	   EXT="gz"
		   ;;
		5)
    	   EXT="bz2"
		   ;;
    esac
	pack
}

pack(){
	case $EXT in
        "zip")
			getArchiveName
			toZip
			;;
        "rar")
		   getArchiveName
           toRar
		   ;;
        "tar")
		   getArchiveName
    	   toTar
		   ;;
		"gz")
		   getArchiveName
    	   toGz
		   ;;
		"bz2")
		   getArchiveName
    	   toBz2
		   ;;
    esac
	./duzyskrypt.sh

}

toZip()
{
	zip $DIR_NAME ${FILE_LIST[@]}
	rm $DIR_NAME
}

toTar()
{
	tar -cvzf $DIR_NAME.tar ${FILE_LIST[@]}
	rm $DIR_NAME
}

toGz(){ 

		toTar
		gzip $DIR_NAME.tar


} 

toBz2(){

		toTar
		bzip2 $DIR_NAME.tar
}
toRar(){
	rar a $DIR_NAME.rar ${FILE_LIST[@]}

}
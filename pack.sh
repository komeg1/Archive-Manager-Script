
packMenu(){
	FILE=$($DIALOG_CHOOSE_FILE)
	if [ $? -eq 0 ]; then
		
		if [ $FILE == "./" ]; then
			ERR=$(dialog --stdout --ok-button "Powrot" --msgbox "Nie mozna dodac \""$FILE"\"" 8 30)
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
			ERR=$(dialog --stdout --ok-button "Powrot" --msgbox "Nie wybrano zadnych plikow." 8 30)
			if [ $? -eq 0 ]; then
				packMenu
			fi
			
		fi
	fi
}

getArchiveName(){
	clear
	DIR_NAME=$($DIALOG_ARCHIVE_NAME)
}

chooseExtension(){
	clear
	EXT_CHOICE=$($DIALOG_EXTENSION_CHOICE)
	for CHOICE in $EXT_CHOICE
do
    case $CHOICE in
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
done
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
		   if [ ${#FILE_LIST[@]} -gt 1 ]; then
		   	getArchiveName
		   fi
    	   toGz
		   ;;
		"bz2")
		   if [ ${#FILE_LIST[@]} -gt 1 ]; then
		   	getArchiveName
		   fi
    	   toBz2
		   ;;
    esac

}

toZip()
{
	zip $DIR_NAME ${FILE_LIST[@]}
}

toTar()
{
	tar -cvzf $DIR_NAME.tar ${FILE_LIST[@]}
}

#Aby stworzyć archiwum .gz/.bzip2 kilku plikow naraz najpierw kompresuje je do .tar
toGz(){ 
	if [ ${#FILE_LIST[@]} -eq 1 ]; then
		gzip -k ${FILE_LIST[@]}
		#mv ${FILE_LIST[@]}.gz $DIR_NAME.gz
	else
		toTar
		gzip $DIR_NAME.tar
	fi

} 

toBz2(){
if [ ${#FILE_LIST[@]} -eq 1 ]; then
		bzip2 -k ${FILE_LIST[@]}
		#mv ${FILE_LIST[@]}.gz $DIR_NAME.gz
	else
		toTar
		bzip2 $DIR_NAME.tar
	fi
}
toRar(){
	rar a $DIR_NAME.rar ${FILE_LIST[@]}

}
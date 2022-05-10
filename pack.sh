
packMenu(){
<<<<<<< HEAD
    PLIK=$(dialog --stdout --ok-button "DODAJ" --cancel-button "UTWORZ" --fselect ./ 0 0 0)	
	EXIT=$?
	if [[ -z $PLIK ]]; then
		PLIK=$(pwd)
	fi
=======
    FILES=$(dialog --stdout --ok-button "DODAJ" --cancel-button "UTWORZ" --fselect ./ 0 0 0)	
	if [ $? -eq 0 ]; then
		FILE_LIST+=($FILES)
		packMenu
		
	else
		chooseExtension
	fi
}

getArchiveName(){
	clear
	DIR_NAME=$(dialog --stdout --inputbox "Podaj nazwe archiwum (NIE DLA JEDNEGO PLIKU BZ2 I GZ)" 0 0)	
}

chooseExtension(){
	clear
	EXT_CHOICES=$(dialog --keep-tite --menu "Wybierz rozszerzenie:" 30 30 30 "${EXT_OPTS[@]}" 2>&1 >/dev/tty)
	for CHOICE in $EXT_CHOICES
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
>>>>>>> b3c0c86 (master)
}
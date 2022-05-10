packMenu(){
    PLIK=$(dialog --stdout --ok-button "DODAJ" --cancel-button "UTWORZ" --fselect ./ 0 0 0)	
	EXIT=$?
	if [[ -z $PLIK ]]; then
		PLIK=$(pwd)
	fi
}
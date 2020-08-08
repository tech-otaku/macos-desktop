#!/usr/bin/env bash

[ -z $1 ] && TIMES=5 || TIMES=$1

rm set-desktop-catalina-tests.txt

echo -e "Randomly generated $(date '+on %Y-%m-%d at %H:%M:%S') by $0 using $(system_profiler SPSoftwareDataType | awk '/System Version/' | cut -d ':' -f2 | sed -e 's/^[[:space:]]*//')\n" >> set-desktop-catalina-tests.txt 

bash ../set-desktop-catalina.sh default

sleep 1

for (( i=1;i<=$TIMES;i++ )); do 
	RANDNUM=$((1 + RANDOM % $(wc -l <  desktop-images.txt)))
	SELECTION=$(sed ''$RANDNUM'!d' desktop-images.txt)
	bash ../set-desktop-catalina.sh "$SELECTION"
	
	sleep 1

	echo -e "$i/$TIMES. $SELECTION:\n" >> set-desktop-catalina-tests.txt
	echo -e "--------------------------------- data ---------------------------------  --------- preferences ---------" >> set-desktop-catalina-tests.txt
	sqlite3 ${HOME}/Library/Application\ Support/Dock/desktoppicture.db < config.txt "SELECT data.rowid, data.value, preferences.rowid, preferences.key, preferences.data_id, preferences.picture_id FROM data INNER JOIN preferences ON data.rowid = preferences.data_id;" >> set-desktop-catalina-tests.txt
	echo -e "\n\n" >> set-desktop-catalina-tests.txt
done
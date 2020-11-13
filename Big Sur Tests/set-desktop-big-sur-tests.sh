#!/usr/bin/env bash

[ -z $1 ] && TIMES=5 || TIMES=$1

rm set-desktop-big-sur-tests.txt

echo -e "Randomly generated $(date '+on %Y-%m-%d at %H:%M:%S') by $0 using Big Sur Developer Beta build $(system_profiler SPSoftwareDataType | awk '/System Version/ {print $5}')\n" >> set-desktop-big-sur-tests.txt 

pushd ../ > /dev/null
bash set-desktop.sh default
popd > /dev/null

sleep 3

for (( i=1;i<=$TIMES;i++ )); do 
	RANDNUM=$((1 + RANDOM % $(wc -l <  desktop-images.txt)))
	SELECTION=$(sed ''$RANDNUM'!d' desktop-images.txt)

    pushd ../ > /dev/null
	bash set-desktop.sh "$SELECTION"
    popd > /dev/null
	
	sleep 3

	echo -e "$i/$TIMES. $SELECTION:\n" >> set-desktop-big-sur-tests.txt
	echo -e "--------------------------------- data ---------------------------------  --------- preferences ---------" >> set-desktop-big-sur-tests.txt
	sqlite3 ${HOME}/Library/Application\ Support/Dock/desktoppicture.db < execute.sql >> set-desktop-big-sur-tests.txt
	echo -e "\n\n" >> set-desktop-big-sur-tests.txt
done

#!/usr/bin/env bash

#location="/Users/steve/Library/CloudStorage/iCloud Drive/Documents/GitHub/macos-desktop"
location="/Users/steve/Developer/GitHub/macos-desktop"
bash "$location"/set-desktop-catalina.sh "$1"
echo -e "$2/$3. $1:\n" >> "$location"/set-desktop-catalina-tests.txt
echo -e "--------------------------------- data ---------------------------------  --------- preferences ---------" >> "$location"/set-desktop-catalina-tests.txt
sleep 3
sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "SELECT data.rowid, data.value, preferences.rowid, preferences.key, preferences.data_id, preferences.picture_id FROM data INNER JOIN preferences ON data.rowid = preferences.data_id;" >> "$location"/set-desktop-catalina-tests.txt
echo -e "\n\n" >> "$location"/set-desktop-catalina-tests.txt
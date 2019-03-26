#!/usr/bin/env bash

# AUTHOR: Steve Ward [steve@tech-otaku.com]
# URL: https://github.com/tech-otaku/macos-desktop.git
# README: https://github.com/tech-otaku/macos-desktop/blob/master/README.md

# USAGE: [bash] /path/to/set-desktop-mojave.sh <desktop image>

    # Where <desktop image> can be...
        # HEIF (.heic) images
            # mojave = Mojave Dynamic
            # light = Mojave Light (Still)
            # dark = Mojave Dark (Still)
            # solar = Solar Gradients
        # non-HEIF (.heic) images e.g.
            # "/Library/Desktop Pictures/High Sierra.jpg"
        # Other
            # default = set the database [$db] to the default

# EXAMPLE: [bash] /path/to/set-desktop-mojave.sh light



# # # # # # # # # # # # # # # # 
# FUNCTION DECLARATIONS
#

# Restore the user's ~/.sqliterc configuration file renamed to ~/.sqliterc-HH:MM:SS.
    function restore_sqliterc {
        if [ -f ${HOME}/.sqliterc-$timestamp ]; then
            mv ${HOME}/.sqliterc-$timestamp ${HOME}/.sqliterc
        fi
    }



# # # # # # # # # # # # # # # # 
# VARIABLES
#

#   db = database name including path
#   value = value of the `value` column in the `data` table for new rows
#   key = value of the `key` column in the `preferences` table for new rows
#   image = the title or filename of the Desktop image
#   lastrow[0] = row id of the row in the `data` table with the highest row id
#   lastrow[1] = row id of the row in the `preferences` table with the highest row id

    db=${HOME}/Library/Application\ Support/Dock/desktoppicture.db



# # # # # # # # # # # # # # # # 
# DISABLE SQLITE3 CONFIG FILE
#

# To avoid unexcpected results the user's ~/.sqliterc configuration file may cause when `sqlite3` is executed, stop it being loaded by temporarily renaming it to ~/.sqliterc-HH:MM:SS
    if [ -f ${HOME}/.sqliterc ]; then
        timestamp=$(date '+%H-%M-%S')
        mv ${HOME}/.sqliterc ${HOME}/.sqliterc-$timestamp
    fi



# # # # # # # # # # # # # # # # 
# USAGE CHECKS
#

# Exit with error if OS version is not 10.14
    if [ $(system_profiler SPSoftwareDataType | awk '/System Version/ {print $4}' | cut -d . -f 2) -ne 14 ]; then
        echo "ERROR: For use with macOS Mojave 10.14.x only."
        restore_sqliterc
        exit 1
    fi

# Exit with error if no Desktop image was passed on the command line.
    if [ -z "$1" ]; then
        echo "ERROR: No image was specified."
        restore_sqliterc
        exit 1
    fi

# Exit with error if the Desktop image is a file that doesn't exist or an invalid option.
    #if  [[ "$1" != "default" &&  "$1" != "mojave" && "$1" != "light" && "$1" != "dark" && "$1" != "solar" ]]; then
    if  [ "$1" != "default" ] && [ "$1" != "mojave" ] && [ "$1" != "light" ] && [ "$1" != "dark" ] && [ "$1" != "solar" ]; then
        re='\.'
        if [[ $1 =~ $re ]]; then # $1 contains a . denoting a filename.ext
            if ! [ -f "$1" ]; then
                echo "ERROR: '$1' doesn't exist."
                restore_sqliterc
                exit 1
            fi
        else
            echo "ERROR: '$1' is not a valid option."
            restore_sqliterc
            exit 1
        fi
    fi

# Exit with error if this is a dual-monitor environment (the `displays` table will have 2 or more rows).
    if [ $(sqlite3 "$db" "SELECT COUNT() FROM displays;") -ge 2 ]; then
        echo "ERROR: This script should not be used in a dual-monitor environment."
        restore_sqliterc
        exit 1
    fi

# Exit with error if multiple Desktops are configured (the `spaces` table will have 2 or more rows).
    if [ $(sqlite3 "$db" "SELECT COUNT() FROM spaces;") -ge 2 ]; then
        echo "ERROR: This script should not be used when multiple Desktops (Spaces) are configured."
        restore_sqliterc
        exit 1
    fi



# We've got this far, let's close System Preferences – if open – before continuing.
    killall System\ Preferences > /dev/null 2>&1    # Write STDOUT and STDERR to /dev/null to supress messages if process isn't running



# # # # # # # # # # # # # # # # 
# SET-UP
#

    key=20
    case "$1" in
        mojave)
            value=1
            image="Mojave Dynamic"
            ;;
        light)
            value=2
            image="Mojave Light (Still)"
            ;;
        dark)
            value=3
            image="Mojave Dark (Still)"
            ;;
        solar)
            value="'/Library/Desktop Pictures/Solar Gradients.heic'"
            key=1
            image="/Library/Desktop Pictures/Solar Gradients.heic"
            ;;
        default)
            # Set the database [$db] to the default and exit. Only works if $db is ~/Library/Application\ Support/Dock/desktoppicture.db
            if [[ "$db" == $HOME/Library/Application\ Support/Dock/desktoppicture.db ]]; then
                ! [ -d $HOME/Library/Application\ Support/Dock/backup ] && mkdir $HOME/Library/Application\ Support/Dock/backup
                mv "$db" $HOME/Library/Application\ Support/Dock/backup/desktoppicture-$(date '+%H-%M-%S').db     # rename the current database [backup/desktoppicture-hh-mm-ss.db] first
                killall Dock    # As desktoppicture.db no longer exists, this creates a new one with default values
                echo "The Desktop image has been set to the default."
                restore_sqliterc
                exit 0
            else
                echo "ERROR: The 'default' option is only appropriate when the database is $HOME/Library/Application Support/Dock/desktoppicture.db"
                restore_sqliterc
                exit 1
            fi
            ;;
        *)
            value="'$1'"
            image="$1"
            key=1
            ;;
    esac



# # # # # # # # # # # # # # # # 
# GET LAST ROW IDS
#

# Get the rowid of the last row to be inserted in the `data` table. This will be used to insert new rows later in the script.
    lastrow[0]=$(sqlite3 "$db" "SELECT ROWID FROM data ORDER BY ROWID DESC LIMIT 1;")

# if `data` contains 0 rows, lastrow[0] is empty/null so explicitily set lastrow[0] to 0
    [ -z "${lastrow[0]}" ] && lastrow[0]=0

# Get the rowid of the last row to be inserted in the `preferences` table. This will be used to insert new rows later in the script.
    lastrow[1]=$(sqlite3 "$db" "SELECT ROWID FROM preferences ORDER BY ROWID DESC LIMIT 1;")

# if `preferences` contains 0 rows, lastrow[1] is empty/null so explicitily set lastrow[1] to 0
    [ -z "${lastrow[1]}" ] && lastrow[1]=0



# # # # # # # # # # # # # # # # 
# DELETE ALL ROWS
#

# Delete all rows in the `data` table.
    sqlite3 "$db" "DELETE FROM data;"

# Delete all rows in the `preferences` table. Causes the `preferences_deleted` trigger to fire.
    sqlite3 "$db" "DELETE FROM preferences;"



# # # # # # # # # # # # # # # # 
# INSERT NEW ROWS
#

# Insert a new row into the `data` table.
    sqlite3 "$db" "INSERT INTO data(rowid,value) VALUES( $((lastrow[0] + 1)), $value );"

# Insert four new rows into the `preferences` table.
    sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((lastrow[1] + 1)),$key,$((lastrow[0] + 1)),3);"
    sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((lastrow[1] + 2)),$key,$((lastrow[0] + 1)),4);"
    sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((lastrow[1] + 3)),$key,$((lastrow[0] + 1)),2);"
    sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((lastrow[1] + 4)),$key,$((lastrow[0] + 1)),1);"

    echo "The Desktop image has been set to $image."



# # # # # # # # # # # # # # # # 
# FINISH UP
#

# Restart the Dock so changes to desktoppicture.db take effect
    killall Dock

# Restore the user's ~/.sqliterc configuration file (if) renamed earlier in this script.
    restore_sqliterc

#!/usr/bin/env bash

# AUTHOR: Steve Ward [steve at tech-otaku dot com]
# URL: https://github.com/tech-otaku/macos-desktop.git
# README: https://github.com/tech-otaku/macos-desktop/blob/master/README.md

# USAGE: [bash] ./set-desktop.sh <desktop image>
# EXAMPLE: [bash] ./set-desktop.sh desert
#   See the README for more examples



# # # # # # # # # # # # # # # # 
# FUNCTION DECLARATIONS
#

# Restore the user's ~/.sqliterc configuration file renamed to ~/.sqliterc-HH:MM:SS.
    function restore_sqliterc {
        if [ -f "$HOME/.sqliterc-$timestamp" ]; then
            mv "$HOME/.sqliterc-$timestamp" "$HOME/.sqliterc"
        fi
    }

# Ensure 'restore_sqliterc' is executed every time the script exits regardless of exit status
    trap restore_sqliterc EXIT

# If the path to an image file contains 'com_apple_MobileAsset_DesktopPicture', check that it exists having previously been downloaded via System Preferences. This function is called regardless of the installed version of macOS, but is currently only relevant for macOS 12 Monterey. 
    function check_file_downloaded {
        # The function is passed the value of either the $value variable or $file variable which is received as $1
        if [[ "$1" == *"com_apple_MobileAsset_DesktopPicture"* ]]; then
            if ! [ -f  "$(echo "$1" | tr -d "'")" ]; then
                filename=$(echo "$(basename "$1")" | tr -d "'")     # e.g. Big Sur Shore Rocks.heic
                printf "ERROR: Please download '%s' via System Preferences first, then re-run this script.\n" "${filename%.*}"  >&2
                false
            else
                true
            fi
        else
            true
        fi
    }



# # # # # # # # # # # # # # # # 
# VARIABLES
#

#   additional = true if additional rows are required in the 'data' and 'preferences' tables (populated from match in the 'option_config' file)
#   backup = location for backups when re-setting 'desktoppicture.db' to the default
#   category = how the image is categorised in System Preferences (populated from match in the 'option_config' file)
#   data_id[0] = the 'data' table row id to be used in the 'preferences' table 
#   data_id[1] = he 'data' table row id to be used in the 'preferences' table (for additional rows only)
#   db = database name including path
#   file = filename of the Desktop image (populated from match in the 'option_config' file)
#   key = value of the 'key' column for new rows in the 'preferences' table (populated from match in the 'option_config' file unless a filename was passed to the script)
#   lastrow[0] = highest row id in the 'data' table 
#   lastrow[1] = highest row id in the 'preferences' table 
#   major = the major version number of the installed release of macOS i.e. 10 (Catalina), 11 (Big Sur), 12 (Monterey)
#   minor = the minor version number of the installed release of macOS. Only used for Catalina and earlier i.e. .14, (10.14), .15 (10.15) etc
#   name = the title or filename of the Desktop image (populated from match in the 'option_config' file unless a filename was passed to the script)
#   option = the option name (populated from match in the 'option_config' file)
#   option_arg = value of the 'option' argument passed to the script (variable needs to be exported so its value is available to the Python code)
#   option_config = file containing option configuration data 
#   option_data = string representing JSON-encoded data for a given option ($option_arg)
#   timestamp = temporary filename suffix added to '.sqliterc' 
#   value = value of the 'value' column for new rows in the 'data' table (populated from match in the 'option_config' file unless a filename was passed to the script)
#   version = the installed version of macOS (variable needs to be exported so its value is available to the Python code)

    unset additional category data_id file key lastrow major minor name option option_arg option_data timestamp value

    db="$HOME/Library/Application Support/Dock/desktoppicture.db"
    backup="$HOME/Library/Application Support/Dock/backup"

    # The version numbering convention has changed with the release of Big Sur where only the major version number is significant for 
    # determining if Big Sur is installed i.e. 11.0, 11.1, 11.2 etc are all versions of Big Sur. This is in contrast to earlier macOS 
    # versions where both the major and minor version numbers are significant i.e 10.15 Catalina, 10.14 Mojave etc.
    major=$(system_profiler SPSoftwareDataType | awk '/System Version/ {print $4}' | cut -d . -f 1)
    minor=$(system_profiler SPSoftwareDataType | awk '/System Version/ {print $4}'| cut -d . -f 2)
    if [ $major -ge 11 ]; then
        # Since macOS Big Sur
        export version=$major
    else
        # Upto and including macOS Catalina
        export version=$major.$minor
    fi

    export option_arg=$1
    option_config=options.json

    unset additional category data_id file key lastrow name option option_data timestamp value



# # # # # # # # # # # # # # # # 
# DISABLE SQLITE3 CONFIG FILE
#

# To avoid unexcpected results the user's ~/.sqliterc configuration file may cause when 'sqlite3' is executed, stop it being loaded by temporarily renaming it to ~/.sqliterc-HH:MM:SS
    if [ -f "$HOME/.sqliterc" ]; then
        timestamp=$(date '+%H-%M-%S')
        mv "$HOME/.sqliterc" "$HOME/.sqliterc-$timestamp"
    fi



# # # # # # # # # # # # # # # # 
# USAGE CHECKS
#

# Exit with error if OS version is not 10.15 or later
    if ! ( ( [ $major -eq 10 ] && [ $minor -eq 15 ] ) || [ $major -ge 11 ] ); then
        printf "ERROR: For use with macOS 10.15 Catalina or later.\n"
        exit 1
    fi

# Exit with error if configuration file doesn't exist
    if [ ! -f "$option_config" ]; then
        printf "ERROR: Can't find configuration file '%s'.\n" "$option_config" 
        exit 1
    fi

# Exit with error if no Desktop image was passed on the command line.
    if [ -z "$option_arg" ]; then
        echo "ERROR: No image was specified."
        exit 1
    fi

# Exit with error if the Desktop image is a file that doesn't exist or an invalid option.
#
#   At this stage there are 5 possibilities regarding the value of the 'option' argument that was passed to the script. Only #4 and #5 should throw an error and exit...
#       1. ...it is equal to 'default'
#       2. ...it is the name (and path) of an existing image file
#       3. ...it is a valid option (as defined in the option configuration file)
#       4. ...it is the name (and path) of an image file that doesn't exist
#       5. ...it is an invalid option (as defined in the option configuration file)

    if [ "$option_arg" != "default" ]; then

    # Look in the configuration file for the value of the 'option' argument that was passed to the script. 
        option_data=$(cat "$option_config" | python -c $'from __future__ import print_function\nimport os,sys,json\ndata=json.loads(sys.stdin.read())\nfor _version in data["versions"]:\n\tif _version["version"]==os.environ["version"]:\n\t\tfor _option in _version["options"]:\n\t\t\tif _option["option"]==os.environ["option_arg"]:print(json.dumps(_option))')

        if [ -z "$option_data" ]; then  # the option that was passed to the script was not found in the configuration file
            re='\.'
            if [[ "$option_arg" =~ \. ]]; then  # $option_arg contains a '.' denoting a filename.ext
                if ! [ -f "$option_arg" ]; then #   4. ...the name (and path) of an image file that doesn't exist
                    if [[ "$option_arg" != *"com_apple_MobileAsset_DesktopPicture"* ]]; then    # For now, ignore image file paths containing 'com_apple_MobileAsset_DesktopPicture'. These are checked later in the script.
                        printf "ERROR: '%s' doesn't exist.\n" "$option_arg"
                        exit 1
                    fi
                fi
            else    #   5. ...an invalid option 
                printf "ERROR: '%s' is not a valid option.\n" "$option_arg"
                exit 1
            fi
        fi
    fi

# Exit with error if this is a dual-monitor environment (the 'displays' table will have 2 or more rows).
    if [ $(sqlite3 "$db" "SELECT COUNT() FROM displays;") -ge 2 ]; then
        echo "ERROR: This script should not be used in a dual-monitor environment."
        exit 1
    fi

# Exit with error if multiple Desktops are configured (the 'spaces' table will have 2 or more rows).
    if [ $(sqlite3 "$db" "SELECT COUNT() FROM spaces;") -ge 2 ]; then
        echo "ERROR: This script should not be used when multiple Desktops (Spaces) are configured."
        exit 1
    fi



# We've got this far, let's quit System Preferences – if open – before continuing.
    killall System\ Preferences > /dev/null 2>&1    # Write STDOUT and STDERR to /dev/null to supress messages if process isn't running



# # # # # # # # # # # # # # # # 
# SET-UP
#

# At this stage there are 3 possibilities regarding the value of the 'option' argument that was passed to the script...
#   1. ...it is equal to 'default'
#   2. ...it is the name (and path) of an existing image file
#   3. ...it is a valid option (as defined in the option configuration file)

    if [ -z "$option_data" ]; then
        if [[ "$option_arg" == "default" ]]; then   # 1. ...equal to 'default'
            # Set the database [$db] to the default and exit. Only works if $db is ~/Library/Application\ Support/Dock/desktoppicture.db
            if [ "$db" == "$HOME/Library/Application Support/Dock/desktoppicture.db" ]; then
                ! [ -d "$backup" ] && mkdir "$backup"
                mv "$db" "$backup/desktoppicture-$(date '+%H-%M-%S').db"     # rename the current database [backup/desktoppicture-hh-mm-ss.db] first
                killall Dock    # As desktoppicture.db no longer exists, this creates a new one with default values
                echo "The Desktop image has been set to the default."
                exit 0
           else
                printf "ERROR: The 'default' option is only appropriate when the database is '%s'.\n" "$HOME/Library/Application Support/Dock/desktoppicture.db"
                exit 1
            fi
        else    # 2. ...the name (and path) of an existing image file
            value="'$option_arg'"
            name="$option_arg"
            key=1

            # If the image file path contains 'com_apple_MobileAsset_DesktopPicture', check it has been downloaded via System Preferences 
            if ! check_file_downloaded "$value"; then
                exit 1
            fi 

        fi
    else    # 3. ...a valid option 
        option=$(echo $option_data | python -c $'from __future__ import print_function\nimport sys, json; data=json.loads(sys.stdin.read())\nprint(data["option"])')
        value=$(echo $option_data | python -c $'from __future__ import print_function\nimport sys, json; data=json.loads(sys.stdin.read())\nprint(data["value"])')
        key=$(echo $option_data | python -c $'from __future__ import print_function\nimport sys, json; data=json.loads(sys.stdin.read())\nprint(data["key"])')
        name=$(echo $option_data | python -c $'from __future__ import print_function\nimport sys, json; data=json.loads(sys.stdin.read())\nprint(data["name"])')
        file=$(echo $option_data | python -c $'from __future__ import print_function\nimport sys, json; data=json.loads(sys.stdin.read())\nif data["file"]: print(data["file"])')
        additional=$(echo $option_data | python -c $'from __future__ import print_function\nimport sys, json; data=json.loads(sys.stdin.read())\nif data["additional"]: print(data["additional"])')
        category=$(echo $option_data | python -c $'from __future__ import print_function\nimport sys, json; data=json.loads(sys.stdin.read())\nprint(data["category"])')

        # If the image file path contains 'com_apple_MobileAsset_DesktopPicture', check it has been downloaded via System Preferences 
        if ! check_file_downloaded "$file"; then
            exit 1
        fi 

    fi



# # # # # # # # # # # # # # # # 
# GET LAST ROW IDS
#

# Get the rowid of the last row to be inserted in the 'data' table. This will be used to insert new rows later in the script.
    lastrow[0]=$(sqlite3 "$db" "SELECT ROWID FROM data ORDER BY ROWID DESC LIMIT 1;")

# if 'data' contains 0 rows, lastrow[0] is empty/null so explicitily set lastrow[0] to 0
    [ -z "$lastrow[0]" ] && lastrow[0]=0

# Get the rowid of the last row to be inserted in the 'preferences' table. This will be used to insert new rows later in the script.
    lastrow[1]=$(sqlite3 "$db" "SELECT ROWID FROM preferences ORDER BY ROWID DESC LIMIT 1;")

# if 'preferences' contains 0 rows, lastrow[1] is empty/null so explicitily set lastrow[1] to 0
    [ -z "$lastrow[1]" ] && lastrow[1]=0



# # # # # # # # # # # # # # # # 
# DELETE ALL ROWS
#

# Delete all rows in the 'data' table.
    sqlite3 "$db" "DELETE FROM data;"

# Delete all rows in the 'preferences' table. Causes the 'preferences_deleted' trigger to fire.
    sqlite3 "$db" "DELETE FROM preferences;"



# # # # # # # # # # # # # # # # 
# INSERT NEW ROWS
#

# Images typically require 1 row in the 'data' table and 4 corresponding rows in the 'preferences' table. Most images categorised by 
# System Preferences as 'Dynamic' or 'Light and Dark Desktop' and a few categorised as 'Desktop Pictures' require a total of 2 rows 
# in the 'data' table and 8 corresponding rows in the 'preferences' table. Images requiring these additional rows are identified in 
# the 'option_config' file with the key/value pair of 'additional/true'.

# Insert a new row into the 'data' table.
	[ ! -z $additional ] && sqlite3 "$db" "INSERT INTO data(rowid,value) VALUES( $((++lastrow[0])), $file );"
    sqlite3 "$db" "INSERT INTO data(rowid,value) VALUES( $((++lastrow[0])), $value );"
    
# Insert new rows into the 'preferences' table.
    data_id[0]=$(sqlite3 "$db" "SELECT rowid FROM data WHERE value=$value;")
    [ ! -z $additional ] && data_id[1]=$(sqlite3 "$db" "SELECT rowid FROM data WHERE value=$file")

    [ ! -z $additional ] && sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((++lastrow[1])),1,${data_id[1]},3);"
    sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((++lastrow[1])),$key,${data_id[0]},3);"
    [ ! -z $additional ] && sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((++lastrow[1])),1,${data_id[1]},4);"
    sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((++lastrow[1])),$key,${data_id[0]},4);"
    [ ! -z $additional ] && sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((++lastrow[1])),1,${data_id[1]},2);"
    sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((++lastrow[1])),$key,${data_id[0]},2);"
    [ ! -z $additional ] && sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((++lastrow[1])),1,${data_id[1]},1);"
    sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((++lastrow[1])),$key,${data_id[0]},1);"
    
    printf "The Desktop image has been set to '%s'\n" "$name"



# # # # # # # # # # # # # # # # 
# FINISH UP
#

# Restart the Dock so changes to desktoppicture.db take effect
    killall Dock

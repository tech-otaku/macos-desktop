#!/usr/bin/env bash

# AUTHOR:   Steve Ward [steve at tech-otaku dot com]
# URL:      https://github.com/tech-otaku/macos-desktop.git
# README:   https://github.com/tech-otaku/macos-desktop/blob/main/README.md

# USAGE:    ./set-desktop.sh IMAGE
# EXAMPLE:  ./set-desktop.sh desert
# See the README for more examples



# # # # # # # # # # # # # # # # 
# FUNCTION DECLARATIONS
#

# Restore the user's ~/.sqliterc configuration file renamed to ~/.sqliterc-HH:MM:SS.
    function restore_sqliterc {
        if [ -f "$HOME/.sqliterc-$timestamp" ]; then
            mv "$HOME/.sqliterc-$timestamp" "$HOME/.sqliterc"
        fi
    }

# Ensure 'restore_sqliterc' is executed every time the script exits regardless of exit status.
    trap restore_sqliterc EXIT

# Get major, minor and patch version numbers of the installed OS.

    function os_version { 
        case $1 in
            'major')
                echo $(system_profiler SPSoftwareDataType | awk '/System Version/ {print $4}' | cut -d . -f 1)
                ;;
            'minor')
                echo $(system_profiler SPSoftwareDataType | awk '/System Version/ {print $4}' | cut -d . -f 2)
                ;;
            'patch')
                echo $(system_profiler SPSoftwareDataType | awk '/System Version/ {print $4}' | cut -d . -f 3)
                ;;
            *)
                ;;
        esac
    }

# If the path to an image file contains 'com.apple.mobileAssetDesktop', check that it exits in the ~/Library/Application Support/com.apple.mobileAssetDesktop/ directory. If it doesn't, download it using information in the Apple-supplied assets file.
    function download_file {

        # # # # # # # # # # # # # # # # 
        # VARIABLES
        #
        # $1            : String representing the full path to the Desktop image passed to this function. e.g  `'~/Library/Application Support/com.apple.mobileAssetDesktop/Big Sur.heic'`
        # asset_count   : Total number of Desktop images contained in the `assets` file. [Count of the `DesktopPictureID` key in the `assets` file]
        # assets        : Full path to the Apple-supplied XML file containing data on downloadable Desktop images.
        # baseurl       : Base URL for ZIP files containing Desktop images. [`__BaseURL` key from the `assets` file] 
        # desktop_image : Name of the Desktop image. [Derived from `filename` and correlates to the the `DesktopPictureID` key in the `assets` file] 
        # filename      : Filename and extension of the Desktop image. [Derived from `$1`]
        # i             : Loop counter
        # relativepath  : Location and unique filename of the individual ZIP file [`__RelativePath` key from the `assets` file] 
        # temp          : Full path to the temporary directory where ZIP files are downloaded. Deleted on completion.
        # zipfile       : Unique filename of the individual ZIP file [Derived from `relativepath`]

    # Only continue if `$1` contains 'com.apple.mobileAssetDesktop'
        if [[ "$1" == *"com.apple.mobileAssetDesktop"* ]]; then                                                 # >>> ~/Library/Application Support/com.apple.mobileAssetDesktop/Big Sur.heic
        # Only continue if `$1` doesn't already exist
            if [ ! -f "$(echo "$1" | sed "s|~/|$HOME/|" | tr -d "'")" ]; then
                filename=$(echo "$(basename "$1")" | tr -d "'")                                                 # >>> Big Sur.heic
                desktop_image=$(echo ${filename%.*})                                                            # >>> Big Sur
                
                if [ -f "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/com_apple_MobileAsset_DesktopPicture.xml" ]; then
                    # This file only exists if any image has previously been downloaded through System Preferences / System Settings
                    assets="/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/com_apple_MobileAsset_DesktopPicture.xml"
                else
                    assets="./com_apple_MobileAsset_DesktopPicture.xml"
                fi 

                asset_count=$(/usr/libexec/PlistBuddy -x -c "Print Assets" "$assets" | grep DesktopPictureID | wc -l)
                temp=$(mktemp -d)

                i=0
                while [ $i -lt $asset_count ]; do

                    if [[  $(/usr/libexec/PlistBuddy -c "Print Assets:$i:DesktopPictureID" "$assets") == $desktop_image ]]; then

                        baseurl=$(/usr/libexec/PlistBuddy -c "Print Assets:$i:__BaseURL" "$assets")             # >>> https://updates.cdn-apple.com/2022/mobileassets/071-94709/78F78503-951B-4326-8D17-1DD080D276B6/

                        relativepath=$(/usr/libexec/PlistBuddy -c "Print Assets:$i:__RelativePath" "$assets")   # >>> com_apple_MobileAsset_DesktopPicture/b261c85a4ec6ed6352e07efd33cbcba68b5c724d.zip

                        zipfile=$(basename $relativepath)                                                       # >>> b261c85a4ec6ed6352e07efd33cbcba68b5c724d.zip

                        printf "Downloading '%s'\n" "$filename"

                        curl -so "$temp/$zipfile" -L "$baseurl$relativepath"
                        unzip -q "$temp/$zipfile" -d "$temp"
                        [ ! -d "$HOME/Library/Application Support/com.apple.mobileAssetDesktop" ] && mkdir "$HOME/Library/Application Support/com.apple.mobileAssetDesktop"
                        mv "$temp/AssetData/$filename" "$HOME/Library/Application Support/com.apple.mobileAssetDesktop"
                        rm -rf "$temp"

                        return

                    fi

                    i=$(( $i + 1 ))
                done

            fi

        fi

    }



# # # # # # # # # # # # # # # # 
# PYTHON INSTALLATION
#

# Check if, and what version of Python is installed
    if [ $(os_version major) -eq 10 ] && [ $(os_version minor) -eq 15 ]; then
    # macOS Catalina (10.15) ships with what appears to be a Python 3 binary 
    # named `/usr/bin/python3`, but this is merely a stub for installing the 
    # command line developer tools that include Python 3. So default to Python 2
        _python=python
    elif [ $(command -v python3) ]; then      # Python 3 installed
    # Use Python 3 binary
        _python=python3
    elif  [ $(command -v python) ]; then    # Python 2 installed
    # Use Python 2 binary 
        _python=python
   else    
    # Exit with error if Python isn't installed
        echo "ERROR: Python is required to use this script."
        exit 1
    fi

    echo $_python


# # # # # # # # # # # # # # # # 
# VARIABLES
#

#   backup = location for backups when re-setting 'desktoppicture.db' to the default
#   category = how the image is categorised in System Preferences (populated from match in the 'option_config' file)
#   data_id = the 'data' table row id to be used in the 'preferences' table 
#   db = database name including path
#   is_file = only set if the argument passed to the script is a filename
#   key = value of the 'key' column for new rows in the 'preferences' table (populated from match in the 'option_config' file unless a filename was passed to the script)
#   lastrow[0] = highest row id in the 'data' table 
#   lastrow[1] = highest row id in the 'preferences' table 
#   major = the major version number of the installed release of macOS i.e. 10 (Catalina), 11 (Big Sur), 12 (Monterey)
#   minor = the minor version number of the installed release of macOS. Only used for Catalina and earlier i.e. .14, (10.14), .15 (10.15) etc
#   name = the title or filename of the Desktop image (populated from match in the 'option_config' file unless a filename was passed to the script)
#   option = the option name (populated from match in the 'option_config' file)
#   option_arg = value of the 'option' argument passed to the script (variable needs to be exported so its value is available to the Python code)
#   option_config = file containing option configuration data (variable needs to be exported so its value is available to the Python code)
#   option_data = string representing JSON-encoded data for a given option ($option_arg)
#   row_count = the number of rows to be added to the 'data' table (populated from match in the 'option_config' file)
#   rows = an array where each element represents the values of the 'value' column for new rows in the 'data' table and the value of the 'key' column for new rows in the 'preferences' table (populated from match in the 'option_config' file unless a filename was passed to the script in which case it is populated using the filename for the 'value' and '1' for the 'key')
#   timestamp = temporary filename suffix added to '.sqliterc' 
#   value = value of the 'value' column for new rows in the 'data' table (populated from match in the 'option_config' file unless a filename was passed to the script)
#   version = the installed version of macOS (variable needs to be exported so its value is available to the Python code)

    unset rows category data_id key lastrow major minor name option option_arg option_data stop timestamp value

    db="$HOME/Library/Application Support/Dock/desktoppicture.db"
    backup="$HOME/Library/Application Support/Dock/backup"

    # The version numbering convention has changed with the release of Big Sur where only the major version number is significant for 
    # determining if Big Sur is installed i.e. 11.0, 11.1, 11.2 etc are all versions of Big Sur. This is in contrast to earlier macOS 
    # versions where both the major and minor version numbers are significant i.e 10.15 Catalina, 10.14 Mojave etc.
    major=$(os_version major)
    minor=$(os_version minor)
    if [ $major -ge 11 ]; then
        # Since macOS Big Sur
        export version=$major
    else
        # Upto and including macOS Catalina
        export version=$major.$minor
    fi

    settings_app="System Settings"
    if [[ $major -lt 13 ]]; then
        settings_app="System Preferences"
    fi

    export option_arg=$1
    export option_config=options.json



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

# Exit with error if OS version is not 10.14 or later
    if ! ( ( [ $major -eq 10 ] && [ $minor -ge 14 ] ) || [ $major -ge 11 ] ); then
        printf "ERROR: For use with macOS 10.14 Mojave or later.\n"
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
        option_data=$($_python -c $'import os,sys,json\nwith open(os.environ["option_config"],"r") as f:\n\tdata = json.load(f)\nfor _version in data["versions"]:\n\tif _version["version"]==os.environ["version"]:\n\t\tfor _option in _version["options"]:\n\t\t\tif _option["option"]==os.environ["option_arg"]:print(json.dumps(_option))')

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

# Exit with error if this is a dual-monitor environment.
    if [ $major -eq 10 ] && [ $minor -eq 14 ]; then
    # The version of system_profiler that ships with macOS Mojave (10.14) can't generate JSON ouput, so use the 'displays' table instead.
    # The 'displays' table will have 2 or more rows
        if [ $(sqlite3 "$db" "SELECT COUNT() FROM displays;") -ge 2 ]; then
            echo "ERROR: This script should not be used in a dual-monitor environment."
            exit 1
        fi
    else
    # The 'spdisplays_ndrvs' array will have 2 or more objects
        if [ $(system_profiler SPDisplaysDataType -json | $_python -c $'import os,sys,json\ndata=json.loads(sys.stdin.read())\nprint(len(data["SPDisplaysDataType"][0]["spdisplays_ndrvs"]))') -ge 2 ]; then
            echo "ERROR: This script should not be used in a multi-monitor environment."
            exit 1
        fi
    fi

# Exit with error if multiple Desktops are configured (the 'spaces' table will have 2 or more rows).
    if [ $(sqlite3 "$db" "SELECT COUNT() FROM spaces;") -ge 2 ]; then
        echo "ERROR: This script should not be used when multiple Desktops (Spaces) are configured."
        exit 1
    fi



# Quit System Settings (previously System Preferences prior to macOS Ventura 13)
    killall "$settings_app" 2> /dev/null                        # Write STDERR to /dev/null to supress message if process isn't running



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

        # If the image file path contains 'com.apple.mobileAssetDesktop', check it has been downloaded via System Preferences (Monterey) or System Settings (Ventura and later). If not, download it. [macOS Monterey 12 and later]
            if [ $major -ge 12 ]; then
                download_file "$value"
            fi

            rows[0]=$value:$key
            unset value key

        fi
    else    # 3. ...a valid option 
        option=$(echo $option_data | $_python -c $'import sys, json; data=json.loads(sys.stdin.read())\nprint(data["option"])')
        name=$(echo $option_data | $_python -c $'import sys, json; data=json.loads(sys.stdin.read())\nprint(data["name"])')
        category=$(echo $option_data | $_python -c $'import sys, json; data=json.loads(sys.stdin.read())\nprint(data["category"])')

        # The row_count variable stores the number of Python dictionaries (JSON objects) in the Python list (JSON array) whose key is "rows". This is a minimum of 1 and a maximum of 2. 
        row_count=$(echo $option_data | $_python -c $'import sys, json; data=json.loads(sys.stdin.read())\nprint(len(data["rows"]))')

        stop=$(expr $row_count - 1)
        for i in $(seq 0 $stop); do 
            export i 
            value=$(echo $option_data | $_python -c $'import os, sys, json; data=json.loads(sys.stdin.read())\ne=int(os.environ["i"])\nprint(data["rows"][int(os.environ["i"])]["value"])')
            key=$(echo $option_data | $_python -c $'import os, sys, json; data=json.loads(sys.stdin.read())\ne=int(os.environ["i"])\nprint(data["rows"][int(os.environ["i"])]["key"])')

        # If the image file path contains 'com.apple.mobileAssetDesktop', check it has been downloaded via System Preferences (Monterey) or System Settings (Ventura and later). If not, download it. [macOS Monterey 12 and later]
            if [ $major -ge 12 ]; then
                download_file "$value"
            fi

            rows[$i]=$value:$key
            unset value key
        done

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
# System Preferences as 'Dynamic Desktop' or 'Light and Dark Desktop' and a few categorised as 'Desktop Pictures' require a total of 2 rows 
# in the 'data' table and 8 corresponding rows in the 'preferences' table. 

    for i in "${rows[@]}"; do

        value=$(echo $i | cut -d ':' -f1)
        key=$(echo $i | cut -d ':' -f2)

    # Insert a new row into the 'data' table.
        sqlite3 "$db" "INSERT INTO data(rowid,value) VALUES( $((++lastrow[0])), $value );"

    # Insert new rows into the 'preferences' table.
        data_id=$(sqlite3 "$db" "SELECT rowid FROM data WHERE value=$value;")

        sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((++lastrow[1])),$key,${data_id},3);"
        sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((++lastrow[1])),$key,${data_id},4);"
        sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((++lastrow[1])),$key,${data_id},2);"
        sqlite3 "$db" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((++lastrow[1])),$key,${data_id},1);"

        unset value key

    done

    printf "The Desktop image has been set to '%s'\n" "$name"



# # # # # # # # # # # # # # # # 
# FINISH UP
#

# Restart the Dock so changes to desktoppicture.db take effect
    killall Dock

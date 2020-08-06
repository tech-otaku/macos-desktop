#!/usr/bin/env bash

# AUTHOR: Steve Ward [steve@tech-otaku.com]
# URL: https://github.com/tech-otaku/macos-desktop.git
# README: https://github.com/tech-otaku/macos-desktop/blob/master/BIG-SUR.md

# USAGE: [bash] ./set-desktop-big-sur.sh <desktop image>

    # Where <desktop image> can be...
        # HEIF (.heic) images
            # graphic = Big Sur Graphic Automatic
            # light = Big Sur Graphic Light (Still)
            # dark = Big Sur Graphic Dark (Still)
            # big-sur = Big Sur Dynamic
            # big-sur-light = Big Sur Light (Still)
            # big-sur-dark = Big Sur Dark (Still)
            # catalina = Catalina Dynamic
            # catalina-light = Catalina Light (Still)
            # catalina-dark = Catalina Dark (Still)
            # mojave = Mojave Dynamic
            # mojave-light = Mojave Light (Still)
            # mojave-dark = Mojave Dark (Still)
            # solar = Solar Gradients
        # non-HEIF (.heic) images e.g.
            # "/System/Library/Desktop Pictures/High Sierra.jpg"
        # Other
            # default = set the database [$db] to the default

# EXAMPLE: [bash] ./set-desktop-big-sur.sh light



# # # # # # # # # # # # # # # # 
# FUNCTION DECLARATIONS
#

# Restore the user's ~/.sqliterc configuration file renamed to ~/.sqliterc-HH:MM:SS.
    function restore_sqliterc {
        if [ -f "${HOME}"/.sqliterc-"${timestamp}" ]; then
            mv "${HOME}"/.sqliterc-"${timestamp}" "${HOME}"/.sqliterc
        fi
    }
    
# Ensure `restore_sqliterc` is executed every time the script exits regardless of exit status
    trap restore_sqliterc EXIT



# # # # # # # # # # # # # # # # 
# VARIABLES
#

#   db = database name including path
#   backup = location for backups when re-setting `desktoppicture.db` to the default
#   options = array of valid command line options
#   timestamp = temporary filename suffix added to `.sqliterc` 
#   value = value of the `value` column for new rows in the `data` table 
#   key = value of the `key` column for new rows in the `preferences` table
#   image = the title or filename of the Desktop image
#   file = filename of the Desktop image (inserted into `data.value` where appropriate)
#   lastrow[0] = highest row id in the `data` table 
#   lastrow[1] = highest row id in the `preferences` table 

    db="${HOME}"/Library/Application\ Support/Dock/desktoppicture.db
    backup="${HOME}"/Library/Application\ Support/Dock/backup
    options=("big-sur" "big-sur-light" "big-sur-dark" "catalina" "catalina-light" "catalina-dark" "dark"  "default" "graphic" "light" "mojave" "mojave-light" "mojave-dark" "solar")



# # # # # # # # # # # # # # # # 
# DISABLE SQLITE3 CONFIG FILE
#

# To avoid unexcpected results the user's ~/.sqliterc configuration file may cause when `sqlite3` is executed, stop it being loaded by temporarily renaming it to ~/.sqliterc-HH:MM:SS
    if [ -f "${HOME}"/.sqliterc ]; then
        timestamp=$(date '+%H-%M-%S')
        mv "${HOME}"/.sqliterc "${HOME}"/.sqliterc-"${timestamp}"
    fi



# # # # # # # # # # # # # # # # 
# USAGE CHECKS
#

# Exit with error if OS version is not 11.0
    if [ $(system_profiler SPSoftwareDataType | awk '/System Version/ {print $4}' | cut -d . -f 1,2) != 11.0 ]; then
        echo "ERROR: For use with macOS Big Sur 11.0.x only."
        exit 1
    fi

# Exit with error if no Desktop image was passed on the command line.
    if [ -z "${1}" ]; then
        echo "ERROR: No image was specified."
        exit 1
    fi

# Exit with error if the Desktop image is a file that doesn't exist or an invalid option.
    if [[ ! " ${options[@]} " =~ " ${1} " ]]; then
    #if ! (printf '%s\n' "${options[@]}" | grep -xq "${1}"); then
        re='\.'
        if [[ "${1}" =~ ${re} ]]; then # $1 contains a . denoting a filename.ext
           if ! [ -f "${1}" ]; then
                echo "ERROR: '${1}' doesn't exist."
                exit 1
            fi
        else
            echo "ERROR: '${1}' is not a valid option."
            exit 1
        fi
    fi

# Exit with error if this is a dual-monitor environment (the `displays` table will have 2 or more rows).
    if [ $(sqlite3 "${db}" "SELECT COUNT() FROM displays;") -ge 2 ]; then
        echo "ERROR: This script should not be used in a dual-monitor environment."
        exit 1
    fi

# Exit with error if multiple Desktops are configured (the `spaces` table will have 2 or more rows).
    if [ $(sqlite3 "${db}" "SELECT COUNT() FROM spaces;") -ge 2 ]; then
        echo "ERROR: This script should not be used when multiple Desktops (Spaces) are configured."
        exit 1
    fi



# We've got this far, let's quit System Preferences – if open – before continuing.
    killall System\ Preferences > /dev/null 2>&1    # Write STDOUT and STDERR to /dev/null to supress messages if process isn't running



# # # # # # # # # # # # # # # # 
# SET-UP
#

    key=20
    case "${1}" in
        graphic)
            value=1
            image="Big Sur Graphic Automatic"
            ;;
        light)
            value=2
            image="Big Sur Graphic Light (Still)"
            ;;
        dark)
            value=3
            image="Big Sur Graphic Dark (Still)"
            ;;
        big-sur)
            value=1
            image="Big Sur Dynamic"
            file="'/System/Library/Desktop Pictures/Big Sur.heic'"
            ;;
        big-sur-light)
            value=2
            image="Big Sur Light (Still)"
            file="'/System/Library/Desktop Pictures/Big Sur.heic'"
            ;;
        big-sur-dark)
            value=3
            image="Big Sur Dark (Still)"
            file="'/System/Library/Desktop Pictures/Big Sur.heic'"
            ;;
        catalina)
            value=1
            image="Catalina Dynamic"
            file="'/System/Library/Desktop Pictures/Catalina.heic'"
            ;;
        catalina-light)
            value=2
            image="Catalina Light (Still)"
            file="'/System/Library/Desktop Pictures/Catalina.heic'"
            ;;
        catalina-dark)
            value=3
            image="Catalina Dark (Still)"
            file="'/System/Library/Desktop Pictures/Catalina.heic'"
            ;;
        mojave)
            value=1
            image="Mojave Dynamic"
            file="'/System/Library/Desktop Pictures/Mojave.heic'"
            ;;
        mojave-light)
            value=2
            image="Mojave Light (Still)"
            file="'/System/Library/Desktop Pictures/Mojave.heic'"
            ;;
        mojave-dark)
            value=3
            image="Mojave Dark (Still)"
            file="'/System/Library/Desktop Pictures/Mojave.heic'"
            ;;
        solar)
            value=1
            image="Solar Gradients"
            file="'/System/Library/Desktop Pictures/Solar Gradients.heic'"
            ;;
        default)
            # Set the database [$db] to the default and exit. Only works if $db is ~/Library/Application\ Support/Dock/desktoppicture.db
            if [[ "${db}" == ~/Library/Application\ Support/Dock/desktoppicture.db ]]; then
                ! [ -d "${backup}" ] && mkdir "${backup}"
                mv "${db}" "${backup}"/desktoppicture-$(date '+%H-%M-%S').db     # rename the current database [backup/desktoppicture-hh-mm-ss.db] first
                killall Dock    # As desktoppicture.db no longer exists, this creates a new one with default values
                echo "The Desktop image has been set to the default."
                exit 0
            else
                echo "ERROR: The 'default' option is only appropriate when the database is \"${HOME}/Library/Application Support/Dock/desktoppicture.db\""
                exit 1
            fi
            ;;
        *)
            value="'${1}'"
            image="${1}"
            key=1
            ;;
    esac
    

# # # # # # # # # # # # # # # # 
# GET LAST ROW IDS
#

# Get the rowid of the last row to be inserted in the `data` table. This will be used to insert new rows later in the script.
    lastrow[0]=$(sqlite3 "${db}" "SELECT ROWID FROM data ORDER BY ROWID DESC LIMIT 1;")

# if `data` contains 0 rows, lastrow[0] is empty/null so explicitily set lastrow[0] to 0
    [ -z "${lastrow[0]}" ] && lastrow[0]=0

# Get the rowid of the last row to be inserted in the `preferences` table. This will be used to insert new rows later in the script.
    lastrow[1]=$(sqlite3 "${db}" "SELECT ROWID FROM preferences ORDER BY ROWID DESC LIMIT 1;")

# if `preferences` contains 0 rows, lastrow[1] is empty/null so explicitily set lastrow[1] to 0
    [ -z "${lastrow[1]}" ] && lastrow[1]=0



# # # # # # # # # # # # # # # # 
# DELETE ALL ROWS
#

# Delete all rows in the `data` table.
    sqlite3 "${db}" "DELETE FROM data;"

# Delete all rows in the `preferences` table. Causes the `preferences_deleted` trigger to fire.
    sqlite3 "${db}" "DELETE FROM preferences;"



# # # # # # # # # # # # # # # # 
# INSERT NEW ROWS
#


# Insert a new row into the `data` table.
    sqlite3 "${db}" "INSERT INTO data(rowid,value) VALUES( $((lastrow[0] + 1)), ${value} );"

# Insert new rows into the `preferences` table.
    data_id=$(sqlite3 "${db}" "SELECT rowid FROM data WHERE value=${value};")
    sqlite3 "${db}" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((lastrow[1] + 1)),${key},${data_id},3);"
    sqlite3 "${db}" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((lastrow[1] + 2)),${key},${data_id},4);"
    sqlite3 "${db}" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((lastrow[1] + 3)),${key},${data_id},2);"
    sqlite3 "${db}" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((lastrow[1] + 4)),${key},${data_id},1);"


# Additional rows need to be inserted into the `data` and `preferences` table if the desktop image is being set to Big Sur Dynamic, Big Sur Light (Still), Big Sur Dark (Still),
# Catalina Dynamic, Catalina Light (Still), Catalina Dark (Still), Mojave Dynamic, Mojave Light (Still) or Mojave Dark (Still)
    if [[ "${1}" == big-sur* ]] || [[ "${1}" == catalina* ]] || [[ "${1}" == mojave* ]] || [[ "${1}" == solar ]]; then

    # Insert a new row into the `data` table.
        sqlite3 "${db}" "INSERT INTO data(rowid,value) VALUES( $((lastrow[0] + 2)), ${file} );"

    # Insert new rows into the `preferences` table.
        key=1
        data_id=$(sqlite3 "${db}" "SELECT rowid FROM data WHERE value=${file}")
        sqlite3 "${db}" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((lastrow[1] + 5)),${key},${data_id},3);"
        sqlite3 "${db}" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((lastrow[1] + 6)),${key},${data_id},4);"
        sqlite3 "${db}" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((lastrow[1] + 7)),${key},${data_id},2);"
        sqlite3 "${db}" "INSERT INTO preferences(rowid,key,data_id,picture_id) VALUES( $((lastrow[1] + 8)),${key},${data_id},1);"
        
    fi

    echo "The Desktop image has been set to ${image}."



# # # # # # # # # # # # # # # # 
# FINISH UP
#

# Restart the Dock so changes to desktoppicture.db take effect
    killall Dock
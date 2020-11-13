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
            # beach = The Beach Dynamic
            # beach-light = The Beach Light (Still)
            # beach-dark = The Beach Dark (Still)
            # big-sur = Big Sur Dynamic
            # big-sur-light = Big Sur Light (Still)
            # big-sur-dark = Big Sur Dark (Still)
            # catalina = Catalina Dynamic
            # catalina-light = Catalina Light (Still)
            # catalina-dark = Catalina Dark (Still)
            # cliffs = The Cliffs Dynamic
            # cliffs-light = The Cliffs Light (Still)
            # cliffs-dark = The Cliffs Dark (Still)
            # desert = The Desert Dynamic
            # desert-light = The Desert Light (Still)
            # desert-dark = The Desert Dark (Still)
            # iridescence = Iridescence Automatic
            # iridescence-light = Iridescence Light (Still)
            # iridescence-dark = Iridescence Dark (Still)
            # dome = Dome Automatic
            # dome-light = Dome Light (Still)
            # dome-dark = Dome Dark (Still)
            # lake = The Lake Dynamic
            # lake-light = The Lake Light (Still)
            # lake-dark = The Lake Dark (Still)
            # peak = Peak Automatic
            # peak-light = Peak Light (Still)
            # peak-dark = Peak Dark (Still)
            # solar = Solar Gradients
            # tree = Tree Automatic
            # tree-light = Tree Light (Still)
            # tree-dark = Tree Dark (Still)
            # valley = Valley Automatic
            # valley-light = Valley Light (Still)
            # valley-dark = Valley Dark (Still)
        # non-HEIF (.heic) images e.g.
            # "/System/Library/Desktop Pictures/Reflection 1.jpg"
        # Other
            # default = set the database [$db] to the default

# EXAMPLE: [bash] ./set-desktop-big-sur.sh beach



# Prevent this script from continuing as it's no longer being maintained in favour of set-desktop.sh
    echo "WARNING: 'set-desktop-big-sur.sh' is no longer being maintained. Please use 'set-desktop.sh' instead."
    exit 0



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
    options=("beach" "beach-light" "beach-dark" "big-sur" "big-sur-light" "big-sur-dark" "catalina" "catalina-light" "catalina-dark" "cliffs" "cliffs-light" "cliffs-dark" "dark"  "default" "desert" "desert-light" "desert-dark" "dome" "dome-light" "dome-dark" "graphic" "iridescence" "iridescence-light" "iridescence-dark" "lake" "lake-light" "lake-dark" "light" "peak" "peak-light" "peak-dark" "tree" "tree-light" "tree-dark" "valley" "valley-light" "valley-dark" "solar")



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
		beach)
            value=1
            image="The Beach Dynamic"
            file="'/System/Library/Desktop Pictures/The Beach.heic'"
            ;;
        beach-light)
            value=2
            image="The Beach Light (Still)"
            file="'/System/Library/Desktop Pictures/The Beach.heic'"
            ;;
        beach-dark)
            value=3
            image="The Beach Dark (Still)"
            file="'/System/Library/Desktop Pictures/The Beach.heic'"
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
		cliffs)
            value=1
            image="The Cliffs Dynamic"
            file="'/System/Library/Desktop Pictures/The Cliffs.heic'"
            ;;
        cliffs-light)
            value=2
            image="The Cliffs Light (Still)"
            file="'/System/Library/Desktop Pictures/The Cliffs.heic'"
            ;;
        cliffs-dark)
            value=3
            image="The Cliffs Dark (Still)"
            file="'/System/Library/Desktop Pictures/The Cliffs.heic'"
            ;;
		desert)
            value=1
            image="The Desert Dynamic"
            file="'/System/Library/Desktop Pictures/The Desert.heic'"
            ;;
        desert-light)
            value=2
            image="The Desert Light (Still)"
            file="'/System/Library/Desktop Pictures/The Desert.heic'"
            ;;
        desert-dark)
            value=3
            image="The Desert Dark (Still)"
            file="'/System/Library/Desktop Pictures/The Desert.heic'"
            ;;
		dome)
            value=1
            image="Dome Automatic"
            file="'/System/Library/Desktop Pictures/Dome.heic'"
            ;;
        dome-light)
            value=2
            image="Dome Light (Still)"
            file="'/System/Library/Desktop Pictures/Dome.heic'"
            ;;
        dome-dark)
            value=3
            image="Dome Dark (Still)"
            file="'/System/Library/Desktop Pictures/Dome.heic'"
            ;;
		iridescence)
            value=1
            image="Iridescence Automatic"
            file="'/System/Library/Desktop Pictures/Iridescence.heic'"
            ;;
        iridescence-light)
            value=2
            image="Iridescence Light (Still)"
            file="'/System/Library/Desktop Pictures/Iridescence.heic'"
            ;;
        iridescence-dark)
            value=3
            image="Iridescence Dark (Still)"
            file="'/System/Library/Desktop Pictures/Iridescence.heic'"
            ;;
		lake)
            value=1
            image="The Lake Dynamic"
            file="'/System/Library/Desktop Pictures/The Lake.heic'"
            ;;
        lake-light)
            value=2
            image="The Lake Light (Still)"
            file="'/System/Library/Desktop Pictures/The Lake.heic'"
            ;;
        lake-dark)
            value=3
            image="The Lake Dark (Still)"
            file="'/System/Library/Desktop Pictures/The Lake.heic'"
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
		peak)
            value=1
            image="Peak Automatic"
            file="'/System/Library/Desktop Pictures/Peak.heic'"
            ;;
        peak-light)
            value=2
            image="Peak Light (Still)"
            file="'/System/Library/Desktop Pictures/Peak.heic'"
            ;;
        peak-dark)
            value=3
            image="Peak Dark (Still)"
            file="'/System/Library/Desktop Pictures/Peak.heic'"
            ;;
        solar)
            value=1
            image="Solar Gradients"
            file="'/System/Library/Desktop Pictures/Solar Gradients.heic'"
            ;;
		tree)
            value=1
            image="Tree Automatic"
            file="'/System/Library/Desktop Pictures/Tree.heic'"
            ;;
        tree-light)
            value=2
            image="Tree Light (Still)"
            file="'/System/Library/Desktop Pictures/Tree.heic'"
            ;;
        tree-dark)
            value=3
            image="Tree Dark (Still)"
            file="'/System/Library/Desktop Pictures/Tree.heic'"
            ;;
		valley)
            value=1
            image="Valley Automatic"
            file="'/System/Library/Desktop Pictures/Valley.heic'"
            ;;
        valley-light)
            value=2
            image="Valley Light (Still)"
            file="'/System/Library/Desktop Pictures/Valley.heic'"
            ;;
        valley-dark)
            value=3
            image="Valley Dark (Still)"
            file="'/System/Library/Desktop Pictures/Valley.heic'"
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


# Additional rows need to be inserted into the `data` and `preferences` table if the desktop image is being set to 
# Beach Dynamic, Beach Light (Still) or Beach Dark (Still)
# Big Sur Dynamic, Big Sur Light (Still) or Big Sur Dark (Still)
# Catalina Dynamic, Catalina Light (Still) or Catalina Dark (Still)
# The Cliffs Dynamic, The Cliffs Light (Still) or The Cliffs Dark (Still)
# The Desert Dynamic, The Desert Light (Still) or The Desert Dark (Still)
# Dome Automatic, Dome Light (Still) or Dome Dark (Still)
# Iridescence Automatic, Iridescence Light (Still) or Iridescence Dark (Still)
# The Lake Dynamic, The Lake Light (Still) or The Lake Dark (Still)
# Peak Automatic, Peak Light (Still) or Peak (Still)
# Tree Automatic, Tree Light (Still) or Tree (Still)
# Valley Automatic, Valley Light (Still) or Valley (Still)
    if [[ "${1}" == beach* ]] || [[ "${1}" == big-sur* ]] || [[ "${1}" == catalina* ]] || [[ "${1}" == cliffs* ]] || [[ "${1}" == desert* ]] || [[ "${1}" == dome* ]] || [[ "${1}" == iridescence* ]] || [[ "${1}" == lake* ]] || [[ "${1}" == peak* ]] || [[ "${1}" == solar ]] || [[ "${1}" == tree* ]] || [[ "${1}" == valley* ]]; then

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
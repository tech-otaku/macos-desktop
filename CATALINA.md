# macOS Catalina 10.15

The script `set-desktop-catalina.sh` has been replaced by `set-desktop.sh`.

## Purpose
Set a user's Desktop image in macOS Catalina 10.15 from the command line. See [Limitations](#limitations)

## Background
An explanation of how Desktop images appear to be managed by macOS since Mojave (10.14) can be found at [Setting the Desktop Image in macOS Mojave From the Command Line](https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line). While this article was written before the release of nacOS Catalina, the majority is still relevant to 10.15. 

## Usage
`[bash] ./set-desktop.sh <desktop image>`

## Examples

#### HEIF (.heic) images

##### Dynamic Desktop

###### Catalina Dynamic
`[bash] ./set-desktop.sh catalina`

###### Catalina Dark (Still)
`[bash] ./set-desktop.sh dark`

###### Catalina Light (Still)
`[bash] ./set-desktop.sh light`

###### Mojave Dynamic
`[bash] ./set-desktop.sh mojave`

###### Mojave Dark (Still)
`[bash] ./set-desktop.sh mojave-dark`

###### Mojave Light (Still)
`[bash] ./set-desktop.sh mojave-light`

###### Solar Gradients
`[bash] ./set-desktop.sh solar`

##### Desktop Pictures

###### Catalina Clouds
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Clouds.heic"`

###### Catalina Coast
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Coast.heic"`

###### Catalina Day [same as *Catalina Light (Still)*]
`[bash] ./set-desktop.sh catalina-day`

###### Catalina Evening
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Evening.heic"`

###### Catalina Night [same as *Catalina Dark (Still)*]
`[bash] ./set-desktop.sh catalina-night`

###### Catalina Rock
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Rock.heic"`

###### Catalina Shoreline
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Shoreline.heic"`

###### Catalina Silhouette
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Silhouette.heic"`

###### Catalina Sunset
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Sunset.heic"`

###### Light Stream Blue
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Light Stream Blue.heic"`

###### Light Stream Red
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Light Stream Red.heic"`

###### Mojave Day [same as *Mojave Light (Still)*]
`[bash] ./set-desktop.sh mojave-day`

###### Mojave Night [same as *Mojave Dark (Still)*]
`[bash] ./set-desktop.sh mojave-might`

#### non-HEIF (.heic) images

###### High Sierra
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/High Sierra.jpg"`

###### Ink Cloud
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Ink Cloud.jpg"`

#### Other

###### Default
`[bash] ./set-desktop.sh default`

## Error Messages

###### Not running macOS Catalina
`ERROR: For use with macOS Catalina 10.15.x only.`

###### No Desktop image passed on the command line
`ERROR: No image was specified.`

###### Supplied Desktop image is a file that doesn't exist
`ERROR: './desktop/image.jpg' doesn't exist.`

###### Invalid option passed on the command line
`ERROR: 'option' is not a valid option.`

###### Attempt to reset a database other than desktoppicture.db to the default
`ERROR: The 'default' option is only appropriate when the database is ~/Library/Application Support/Dock/desktoppicture.db`

###### Possible dual-monitor environment detected
`ERROR: This script should not be used in a dual-monitor environment.`

###### Two or more Desktops (Spaces) detected
`ERROR: This script should not be used when multiple Desktops (Spaces) are configured.`


## Limitations
Works only with a single Desktop (Space) in a single-display environment.

__Not for use with multiple Desktops (Spaces) or in a dual-display environment.__


## Valid Options

All valid options and their corresponding data are stored in the file `options.json`. To list these options for Catalina use the following:

- unsorted in the order they appear in `options.json` use `[python] ./options.py --version catalina`

- sorted by `category` use `[python] ./options.py --sort category --version catalina`

- sorted by `name` use `[python] ./options.py --sort name --version catalina`

- sorted by `option` use `[python] ./options.py --sort option --version catalina`

## Tests

The `set-desktop-catalina-tests.sh` script in the `Catalina Tests` directory executes `set-desktop.sh` a given number of times (the default is 5 if omitted), each time passing it an option or filename randomly selected from `desktop-images.txt`.

The intention is to document the state of the `data` and `preferences` tables in the `desktoppicture.db` database after each iteration. Output is written to `set-desktop-catalina-tests.txt`

To change the Desktop picture 100 times, `cd` into the `Catalina Tests` directory and type `[bash] ./set-desktop-catalina-tests.sh 100`

---

Bact to [TOC](https://github.com/tech-otaku/macos-desktop/blob/master/README.md)
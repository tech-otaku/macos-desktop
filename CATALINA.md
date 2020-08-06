# macOS Catalina 10.15

## Purpose
Set a user's Desktop image in macOS Catalina 10.15 from the command line. See [Limitations](#limitations)

## Background
An explanation of how Desktop images appear to be managed by macOS since Mojave (10.14) can be found at [Setting the Desktop Image in macOS Mojave From the Command Line](https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line). While this article was written before the release of nacOS Catalina, the majority is still relevant to 10.15. 

## Usage
`[bash] ./set-desktop-catalina.sh <desktop image>`

## Examples

#### HEIF (.heic) images

##### Dynamic Desktop

###### Catalina Dynamic
`[bash] ./set-desktop-catalina.sh catalina`

###### Catalina Light (Still)
`[bash] ./set-desktop-catalina.sh light`

###### Catalina Dark (Still)
`[bash] ./set-desktop-catalina.sh dark`

###### Mojave Dynamic
`[bash] ./set-desktop-catalina.sh mojave`

###### Mojave Light (Still)
`[bash] ./set-desktop-catalina.sh mojave-light`

###### Mojave Dark (Still)
`[bash] ./set-desktop-catalina.sh mojave-dark`

###### Solar Gradients
`[bash] ./set-desktop-catalina.sh solar`

##### Desktop

###### Catalina Clouds
`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Catalina Clouds.heic"`

###### Catalina Coast
`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Catalina Coast.heic"`

###### Catalina Day
~`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Catalina Day.heic"`~

Same as *Catalina Light (Still)*. Use `[bash] ./set-desktop-catalina.sh light` instead.

###### Catalina Evening
`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Catalina Evening.heic"`

###### Catalina Night
~`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Catalina Night.heic"`~

Same as *Catalina Dark (Still)*. Use `[bash] ./set-desktop-catalina.sh dark` instead.

###### Catalina Rock
`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Catalina Rock.heic"`

###### Catalina Shoreline
`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Catalina Shoreline.heic"`

###### Catalina Silhouette
`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Catalina Silhouette.heic"`

###### Catalina Sunset
`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Catalina Sunset.heic"`

###### Light Stream Blue
`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Light Stream Blue.heic"`

###### Light Stream Red
`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Light Stream Red.heic"`

###### Mojave Day
~`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Mojave Day.heic"`~

Same as *Mojave Light (Still)*. Use `[bash] ./set-desktop-catalina.sh mojave-light` instead.

###### Mojave Night
~`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Mojave Night.heic"`~

Same as *Mojave Dark (Still)*. Use `[bash] ./set-desktop-catalina.sh mojave-dark` instead.

#### non-HEIF (.heic) images

###### High Sierra
`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/High Sierra.jpg"`

###### Ink Cloud
`[bash] ./set-desktop-catalina.sh "/System/Library/Desktop Pictures/Ink Cloud.jpg"`

#### Other

###### Default
`[bash] ./set-desktop-catalina.sh default`

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

## Tests

The `set-desktop-catalina-tests.sh` script in the `Catalina Tests` directory executes `set-desktop-catalina.sh` a given number of times (the default is 5 if omitted), each time passing it an option or filename randomly selected from `desktop-images.txt`.

The intention is to document the state of the `data` and `preferences` tables in the `desktoppicture.db` database after each iteration. Output is written to `set-desktop-catalina-tests.txt`

To change the Desktop picture 100 times, `cd` into the `Catalina Tests` directory and type `[bash] ./set-desktop-catalina-tests.sh 100`

---

Bact to [TOC](https://github.com/tech-otaku/macos-desktop/blob/master/README.md)
# macOS Big Sur 11.0

**IMPORTANT**: `set-desktop-big-sur.sh` has been tested using **macOS Big Sur Developer Beta 5 [Build 20A5354i]**

## Purpose
Set a user's Desktop image in macOS Big Sur 11.0 from the command line. See [Limitations](#limitations)

## Background
An explanation of how Desktop images appear to be managed by macOS since Mojave (10.14) can be found at [Setting the Desktop Image in macOS Mojave From the Command Line](https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line). While this article was written before the release of the Big Sur Beta, the majority is still relevant to 11.0. 

## Usage
`[bash] ./set-desktop-big-sur.sh <desktop image>`

## Examples

#### HEIF (.heic) images

##### Dynamic Desktop

###### Big Sur Graphic Automatic
`[bash] ./set-desktop-big-sur.sh graphic`

###### Big Sur Graphic Light (Still)
`[bash] ./set-desktop-big-sur.sh light`

###### Big Sur Graphic Dark (Still)
`[bash] ./set-desktop-big-sur.sh dark`

###### Big Sur Dynamic
`[bash] ./set-desktop-big-sur.sh big-sur`

###### Big Sur Light (Still)
`[bash] ./set-desktop-big-sur.sh big-sur-light`

###### Big Sur Dark (Still)
`[bash] ./set-desktop-big-sur.sh big-sur-dark`

###### Catalina Dynamic
`[bash] ./set-desktop-big-sur.sh catalina`

###### Catalina Light (Still)
`[bash] ./set-desktop-big-sur.sh catalina-light`

###### Catalina Dark (Still)
`[bash] ./set-desktop-big-sur.sh catalina-dark`

###### Mojave Dynamic
`[bash] ./set-desktop-big-sur.sh mojave`

###### Mojave Light (Still)
`[bash] ./set-desktop-big-sur.sh mojave-light`

###### Mojave Dark (Still)
`[bash] ./set-desktop-big-sur.sh mojave-dark`

###### Solar Gradients
`[bash] ./set-desktop-big-sur.sh solar`

##### Desktop

###### Big Sur Graphic Light
~`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Big Sur Graphic Day.heic"`~ **<sup>1</sup>**

Same as *Big Sur Graphic Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh light` instead.

###### Big Sur Graphic Dark
~`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Big Sur Graphic Night.heic"`~ **<sup>1</sup>**

Same as *Big Sur Graphic Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh dark` instead.

###### Big Sur Day
~`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Big Sur Day.heic"`~ **<sup>2</sup>**

Same as *Big Sur Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh big-sur-light` instead.

###### Big Sur Night
~`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Big Sur Night.heic"`~ **<sup>2</sup>**

Same as *Big Sur Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh big-sur-dark` instead.

###### Catalina Clouds
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Clouds.heic"`

###### Catalina Coast
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Coast.heic"`

###### Catalina Day
~`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Day.heic"`~ **<sup>3</sup>**

Same as *Catalina Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh catalina-light` instead.

###### Catalina Evening
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Evening.heic"`

###### Catalina Night
~`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Night.heic"`~ **<sup>3</sup>**

Same as *Catalina Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh catalina-dark` instead.

###### Catalina Rock
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Rock.heic"`

###### Catalina Shoreline
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Shoreline.heic"`

###### Catalina Silhouette
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Silhouette.heic"`

###### Catalina Sunset
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Sunset.heic"`

###### Light Stream Blue
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Light Stream Blue.heic"`

###### Light Stream Red
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Light Stream Red.heic"`

###### Mojave Day
~`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Mojave Day.heic"`~ **<sup>4</sup>**

Same as *Mojave Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh mojave-light` instead.

###### Mojave Night
~`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Mojave Night.heic"`~ **<sup>4</sup>**

Same as *Mojave Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh mojave-dark` instead.

<br />

**<sup>1</sup>** Symlink to `/System/Library/Desktop Pictures/Big Sur Graphic.heic` <br >
**<sup>2</sup>** Symlink to `/System/Library/Desktop Pictures/Big Sur.heic` <br >
**<sup>3</sup>** Symlink to `/System/Library/Desktop Pictures/Catalina.heic` <br >
**<sup>4</sup>** Symlink to `/System/Library/Desktop Pictures/Mojave.heic`

#### non-HEIF (.heic) images

###### High Sierra
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/High Sierra.jpg"`

###### Ink Cloud
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Ink Cloud.jpg"`

#### Other

###### Default
`[bash] ./set-desktop-big-sur.sh default`

## Error Messages

###### Not running macOS Big Sur
`ERROR: For use with macOS Big Sur 11.0.x only.`

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

The `set-desktop-big-sur-tests.sh` script in the `Big Sur Tests` directory executes `set-desktop-big-sur.sh` a given number of times (the default is 5 if omitted), each time passing it an option or filename randomly selected from `desktop-images.txt`.

The intention is to document the state of the `data` and `preferences` tables in the `desktoppicture.db` database after each iteration. Output is written to `set-desktop-big-sur-tests.txt`

To change the Desktop picture 100 times, `cd` into the `Big Sur Tests` directory and type `[bash] ./set-desktop-big-sur-tests.sh 100`

---

Bact to [TOC](https://github.com/tech-otaku/macos-desktop/blob/master/README.md)
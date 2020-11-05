# macOS Big Sur 11.0

**IMPORTANT**: `set-desktop-big-sur.sh` has been tested using **macOS 11.0.1 Big Sur Developer Beta [Build 20B5012d]**

## Purpose
Set a user's Desktop image in macOS Big Sur 11.0 from the command line. See [Limitations](#limitations)

## Background
An explanation of how Desktop images appear to be managed by macOS since Mojave (10.14) can be found at [Setting the Desktop Image in macOS Mojave From the Command Line](https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line). While this article was written before the release of the Big Sur Beta, the majority is still relevant to 11.0. 

## Usage
`[bash] ./set-desktop-big-sur.sh <desktop image>`

## Examples

#### Dynamic Desktop

Setting the image to *Dynamic* (e.g. Big Sur Dynamic) ensures it changes throughout the day, based on your location.

##### HEIF (.heic) images

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

###### The Cliffs Dynamic
`[bash] ./set-desktop-big-sur.sh cliffs`

###### The Cliffs Light (Still)
`[bash] ./set-desktop-big-sur.sh cliffs-light`

###### The Cliffs Dark (Still)
`[bash] ./set-desktop-big-sur.sh cliffs-dark`

###### The Lake Dynamic
`[bash] ./set-desktop-big-sur.sh lake`

###### The Lake Light (Still)
`[bash] ./set-desktop-big-sur.sh lake-light`

###### The Lake Dark (Still)
`[bash] ./set-desktop-big-sur.sh lake-dark`

###### The Desert Dynamic
`[bash] ./set-desktop-big-sur.sh desert`

###### The Desert Light (Still)
`[bash] ./set-desktop-big-sur.sh desert-light`

###### The Desert Dark (Still)
`[bash] ./set-desktop-big-sur.sh desert-dark`

###### The Beach Dynamic
`[bash] ./set-desktop-big-sur.sh beach`

###### The Beach Light (Still)
`[bash] ./set-desktop-big-sur.sh beach-light`

###### The Beach Dark (Still)
`[bash] ./set-desktop-big-sur.sh beach-dark`

###### Solar Gradients
`[bash] ./set-desktop-big-sur.sh solar`

#### Light and Dark Desktop

Setting the image to *Automatic* (e.g. Peak Automatic) ensures it conforms to the *Light*, *Dark* or *Auto* setting in **System Preferences** > **General** > **Appearance**.

##### HEIF (.heic) images

###### Peak Automatic
`[bash] ./set-desktop-big-sur.sh peak`

###### Peak Light (Still)
`[bash] ./set-desktop-big-sur.sh peak-light`

###### Peak Dark (Still)
`[bash] ./set-desktop-big-sur.sh peak-dark`

###### Tree Automatic
`[bash] ./set-desktop-big-sur.sh tree`

###### Tree Light (Still)
`[bash] ./set-desktop-big-sur.sh tree-light`

###### Tree Dark (Still)
`[bash] ./set-desktop-big-sur.sh tree-dark`

###### Valley Automatic
`[bash] ./set-desktop-big-sur.sh valley`

###### Valley Light (Still)
`[bash] ./set-desktop-big-sur.sh valley-light`

###### Valley Dark (Still)
`[bash] ./set-desktop-big-sur.sh valley-dark`

###### Dome Automatic
`[bash] ./set-desktop-big-sur.sh dome`

###### Dome Light (Still)
`[bash] ./set-desktop-big-sur.sh dome-light`

###### Dome Dark (Still)
`[bash] ./set-desktop-big-sur.sh dome-dark`

###### Big Sur Graphic Automatic
`[bash] ./set-desktop-big-sur.sh graphic`

###### Big Sur Graphic Light (Still)
`[bash] ./set-desktop-big-sur.sh light`

###### Big Sur Graphic Dark (Still)
`[bash] ./set-desktop-big-sur.sh dark`

###### Iridescence Automatic
`[bash] ./set-desktop-big-sur.sh iridescence`

###### Iridescence Light (Still)
`[bash] ./set-desktop-big-sur.sh iridescence-light`

###### Iridescence Dark (Still)
`[bash] ./set-desktop-big-sur.sh iridescence-dark`

#### Desktop Pictures

##### HEIF (.heic) images

###### Big Sur Graphic Light
Same as *Big Sur Graphic Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh light` instead.

###### Big Sur Graphic Dark
Same as *Big Sur Graphic Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh dark` instead.

###### Big Sur Day
Same as *Big Sur Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh big-sur-light` instead.

###### Big Sur Night
Same as *Big Sur Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh big-sur-dark` instead.

###### Big Sur Mountains
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Big Sur Mountains.heic"`

###### Big Sur Aerial
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Big Sur Aerial.heic"`

###### Big Sur Horizon
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Big Sur Horizon.heic"`

###### Big Sur Coastline
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Big Sur Coastline.heic"`

###### Big Sur Shore Rocks
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Big Sur Shore Rocks.heic"`

###### Big Sur Water's Edge
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Big Sur Waters Edge.heic"`

###### Big Sur Road
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Big Sur Road.heic"`

###### Big Sur Night Succulents
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Big Sur Night Succulents.heic"`

###### Big Sur Night Grasses
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Big Sur Night Grasses.heic"`

###### Catalina Day
Same as *Catalina Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh catalina-light` instead.

###### Catalina Night
Same as *Catalina Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh catalina-dark` instead.

###### Catalina Coast
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Coast.heic"`

###### Catalina Evening
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Evening.heic"`

###### Catalina Rock
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Rock.heic"`

###### Catalina Shoreline
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Shoreline.heic"`

###### Catalina Clouds
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Clouds.heic"`

###### Catalina Silhouette
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Silhouette.heic"`

###### Catalina Sunset
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Catalina Sunset.heic"`

###### Peak Day
Same as *Peak Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh peak-light` instead.

###### Peak Night
Same as *Peak Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh peak-dark` instead.

###### Tree Day
Same as *Tree Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh tree-light` instead.

###### Tree Night
Same as *Tree Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh tree-dark` instead.

###### Valley Day
Same as *Valley Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh valley-light` instead.

###### Valley Night
Same as *Valley Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh valley-dark` instead.

###### Dome Day
Same as *Dome Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh dome-light` instead.

###### Dome Night
Same as *Dome Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh dome-dark` instead.

###### The Cliffs Day
Same as *The Cliffs Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh cliffs-light` instead.

###### The Cliffs Night
Same as *The Cliffs Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh cliffs-dark` instead.

###### The Lake Day
Same as *The Lake Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh lake-light` instead.

###### The Lake Night
Same as *The Lake Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh lake-dark` instead.

###### The Desert Day
Same as *The Desert Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh desert-light` instead.

###### The Desert Night
Same as *The Desert Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh desert-dark` instead.

###### The Beach Day
Same as *The Beach Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh beach-light` instead.

###### The Beach Night
Same as *The Beach Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh beach-dark` instead.

###### Iridescence Light
Same as *Iridescence Light (Still)*. Use `[bash] ./set-desktop-big-sur.sh iridescence-light` instead.

###### Iridescence Dark
Same as *Iridescence Dark (Still)*. Use `[bash] ./set-desktop-big-sur.sh iridescence-dark` instead.

###### Light Stream Blue
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Light Stream Blue.heic"`

###### Light Stream Red
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Light Stream Red.heic"`

##### non-HEIF (.heic) images

###### Reflection Grey
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Reflection 1.jpg"`

###### Reflection Orange
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Reflection 2.jpg"`

###### Reflection Green
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Reflection 3.jpg"`

###### Reflection Purple
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Reflection 4.jpg"`

#### Other

###### Default
`[bash] ./set-desktop-big-sur.sh default`

##### non-HEIF (.heic) images

###### Electric Blue
`[bash] ./set-desktop-big-sur.sh "/System/Library/Desktop Pictures/Solid Colors/Electric Blue.png"`

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
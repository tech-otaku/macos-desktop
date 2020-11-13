# macOS Big Sur 11.0

The script `set-desktop-big-sur.sh` has been replaced by `set-desktop.sh`.

## Purpose
Set a user's Desktop image in macOS Big Sur 11.0 from the command line. See [Limitations](#limitations)

## Background
An explanation of how Desktop images appear to be managed by macOS since Mojave (10.14) can be found at [Setting the Desktop Image in macOS Mojave From the Command Line](https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line). While this article was written before the release of the Big Sur Beta, the majority is still relevant to 11.0. 

## Usage
`[bash] ./set-desktop.sh <desktop image>`

## Examples

#### Dynamic Desktop

Setting the image to *Dynamic* (e.g. The Beach Dynamic) ensures it changes throughout the day, based on your location.

##### HEIF (.heic) images

###### The Beach Dynamic
`[bash] ./set-desktop.sh beach`

###### The Beach Dark (Still)
`[bash] ./set-desktop.sh beach-dark`

###### The Beach Light (Still)
`[bash] ./set-desktop.sh beach-light`

###### Big Sur Dynamic
`[bash] ./set-desktop.sh big-sur`

###### Big Sur Dark (Still)
`[bash] ./set-desktop.sh big-sur-dark`

###### Big Sur Light (Still)
`[bash] ./set-desktop.sh big-sur-light`

###### Catalina Dynamic
`[bash] ./set-desktop.sh catalina`

###### Catalina Dark (Still)
`[bash] ./set-desktop.sh catalina-dark`

###### Catalina Light (Still)
`[bash] ./set-desktop.sh catalina-light`

###### The Cliffs Dynamic
`[bash] ./set-desktop.sh cliffs`

###### The Cliffs Dark (Still)
`[bash] ./set-desktop.sh cliffs-dark`

###### The Cliffs Light (Still)
`[bash] ./set-desktop.sh cliffs-light`

###### The Desert Dynamic
`[bash] ./set-desktop.sh desert`

###### The Desert Dark (Still)
`[bash] ./set-desktop.sh desert-dark`

###### The Desert Light (Still)
`[bash] ./set-desktop.sh desert-light`

###### The Lake Dynamic
`[bash] ./set-desktop.sh lake`

###### The Lake Dark (Still)
`[bash] ./set-desktop.sh lake-dark`

###### The Lake Light (Still)
`[bash] ./set-desktop.sh lake-light`

###### Solar Gradients
`[bash] ./set-desktop.sh solar`

#### Light and Dark Desktop

Setting the image to *Automatic* (e.g. Peak Automatic) ensures it conforms to the *Light*, *Dark* or *Auto* setting in **System Preferences** > **General** > **Appearance**.

##### HEIF (.heic) images

###### Big Sur Graphic Automatic
`[bash] ./set-desktop.sh graphic`

###### Big Sur Graphic Dark (Still)
`[bash] ./set-desktop.sh dark`

###### Big Sur Graphic Light (Still)
`[bash] ./set-desktop.sh light`

###### Dome Automatic
`[bash] ./set-desktop.sh dome`

###### Dome Dark (Still)
`[bash] ./set-desktop.sh dome-dark`

###### Dome Light (Still)
`[bash] ./set-desktop.sh dome-light`

###### Iridescence Automatic
`[bash] ./set-desktop.sh iridescence`

###### Iridescence Dark (Still)
`[bash] ./set-desktop.sh iridescence-dark`

###### Iridescence Light (Still)
`[bash] ./set-desktop.sh iridescence-light`

###### Peak Automatic
`[bash] ./set-desktop.sh peak`

###### Peak Dark (Still)
`[bash] ./set-desktop.sh peak-dark`

###### Peak Light (Still)
`[bash] ./set-desktop.sh peak-light`

###### Tree Automatic
`[bash] ./set-desktop.sh tree`

###### Tree Dark (Still)
`[bash] ./set-desktop.sh tree-dark`

###### Tree Light (Still)
`[bash] ./set-desktop.sh tree-light`

###### Valley Automatic
`[bash] ./set-desktop.sh valley`

###### Valley Dark (Still)
`[bash] ./set-desktop.sh valley-dark`

###### Valley Light (Still)
`[bash] ./set-desktop.sh valley-light`

#### Desktop Pictures

##### HEIF (.heic) images

###### The Beach Day [same as *The Beach Light (Still)*]
`[bash] ./set-desktop.sh beach-day`

###### The Beach Night [same as *The Beach Dark (Still)*]
`[bash] ./set-desktop.sh beach-night` 

###### Big Sur Aerial
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Aerial.heic"`

###### Big Sur Coastline
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Coastline.heic"`

###### Big Sur Day [same as *Big Sur Light (Still)*]
`[bash] ./set-desktop.sh big-sur-day`

###### Big Sur Graphic Light [same as *Big Sur Graphic Light (Still)*]
`[bash] ./set-desktop.sh light-2`

###### Big Sur Graphic Dark [same as *Big Sur Graphic Dark (Still)*]
`[bash] ./set-desktop.sh dark-2`

###### Big Sur Horizon
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Horizon.heic"`

###### Big Sur Mountains
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Mountains.heic"`

###### Big Sur Night [same as *Big Sur Dark (Still)*]
`[bash] ./set-desktop.sh big-sur-night`

###### Big Sur Night Grasses
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Night Grasses.heic"`

###### Big Sur Night Succulents
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Night Succulents.heic"`

###### Big Sur Road
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Road.heic"`

###### Big Sur Shore Rocks
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Shore Rocks.heic"`

###### Big Sur Water's Edge
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Waters Edge.heic"`

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

###### The Cliffs Day [same as *The Cliffs Light (Still)*]
`[bash] ./set-desktop.sh cliffs-day`

###### The Cliffs Night [same as *The Cliffs Dark (Still)*]
`[bash] ./set-desktop.sh cliffs-night`

###### The Desert Day [same as *The Desert Light (Still)*]
`[bash] ./set-desktop.sh desert-day`

###### The Desert Night [same as *The Desert Dark (Still)*]
`[bash] ./set-desktop.sh desert-night`

###### Dome Day [same as *Dome Light (Still)*]
`[bash] ./set-desktop.sh dome-day`

###### Dome Night [same as *Dome Dark (Still)*]
`[bash] ./set-desktop.sh dome-night`

###### Iridescence Dark [same as *Iridescence Dark (Still)*]
`[bash] ./set-desktop.sh iridescence-dark-2`

###### Iridescence Light [same as *Iridescence Light (Still)*]
`[bash] ./set-desktop.sh iridescence-light-2`

###### The Lake Day [same as *The Lake Light (Still)*]
`[bash] ./set-desktop.sh lake-day`

###### The Lake Night [same as *The Lake Dark (Still)*]
`[bash] ./set-desktop.sh lake-night`

###### Light Stream Blue
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Light Stream Blue.heic"`

###### Light Stream Red
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Light Stream Red.heic"`

###### Peak Day [same as *Peak Light (Still)*]
`[bash] ./set-desktop.sh peak-day`

###### Peak Night [same as *Peak Dark (Still)*]
`[bash] ./set-desktop.sh peak-night`

###### Tree Day [same as *Tree Light (Still)*]
`[bash] ./set-desktop.sh tree-day`

###### Tree Night [same as *Tree Dark (Still)*]
`[bash] ./set-desktop.sh tree-night`

###### Valley Day [same as *Valley Light (Still)*]
`[bash] ./set-desktop.sh valley-day`

###### Valley Night [same as *Valley Dark (Still)*]
`[bash] ./set-desktop.sh valley-night`

##### non-HEIF (.heic) images

###### Reflection Green
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Reflection 3.jpg"`

###### Reflection Grey
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Reflection 1.jpg"`

###### Reflection Orange
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Reflection 2.jpg"`

###### Reflection Purple
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Reflection 4.jpg"`

#### Other

###### Default
`[bash] ./set-desktop.sh default`

##### non-HEIF (.heic) images

###### Electric Blue
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Electric Blue.png"`

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


## Valid Options

All valid options and their corresponding data are stored in the file `options.json`. To list these options for Big Sur use the following:

- unsorted in the order they appear in `options.json` use `[python] ./options.py --version big-sur`

- sorted by `category` use `[python] ./options.py --sort category --version big-sur`

- sorted by `name` use `[python] ./options.py --sort name --version big-sur`

- sorted by `option` use `[python] ./options.py --sort option --version big-sur`

## Tests

The `set-desktop-big-sur-tests.sh` script in the `Big Sur Tests` directory executes `set-desktop.sh` a given number of times (the default is 5 if omitted), each time passing it an option or filename randomly selected from `desktop-images.txt`.

The intention is to document the state of the `data` and `preferences` tables in the `desktoppicture.db` database after each iteration. Output is written to `set-desktop-big-sur-tests.txt`

To change the Desktop picture 100 times, `cd` into the `Big Sur Tests` directory and type `[bash] ./set-desktop-big-sur-tests.sh 100`

---

Bact to [TOC](https://github.com/tech-otaku/macos-desktop/blob/master/README.md)
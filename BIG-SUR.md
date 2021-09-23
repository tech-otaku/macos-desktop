# macOS 11 Big Sur

The script `set-desktop-big-sur.sh` has been replaced by `set-desktop.sh`.

## Purpose
Set a user's Desktop image in macOS 11 Big Sur from the command line. See [Limitations](#limitations)

## Minimum Requirements

- macos 10.14 Mojave (macOS 11 Big Sur required for the examples below to work)
- Bash 3.2 (Big Sur ships with 3.2.57)
- Python 2.7 (Big Sur ships with 2.7.16)

## Background
An explanation of how Desktop images appear to be managed by macOS since Mojave (10.14) can be found at [Setting the Desktop Image in macOS Mojave From the Command Line](https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line). While this article was written before the release of Big Sur, the majority of the information is still relevant. 

## Usage
`./set-desktop.sh IMAGE`

`IMAGE` can be either 

- a pre-defined named option
- the path to an image file

See the [Valid Options](#valid-options) and [Examples](#examples) sections for more information.

## Examples

These examples use the Apple-supplied Deskop pictures that could otherwise be set via System Preferences. They are categorised and listed as they appear in the Desktop & Screensaver pane as of macOS 11.5.2 Big Sur.

### Desktop Pictures

#### Dynamic Desktop

Setting the image to *Dynamic* (e.g. The Beach Dynamic) ensures it changes throughout the day, based on your location.

###### Big Sur Dynamic
`./set-desktop.sh big-sur`

###### Big Sur Light (Still)
`./set-desktop.sh big-sur-light`

###### Big Sur Dark (Still)
`./set-desktop.sh big-sur-dark`

###### Catalina Dynamic
`./set-desktop.sh catalina`

###### Catalina Light (Still)
`./set-desktop.sh catalina-light`

###### Catalina Dark (Still)
`./set-desktop.sh catalina-dark`

###### The Cliffs Dynamic
`./set-desktop.sh cliffs`

###### The Cliffs Light (Still)
`./set-desktop.sh cliffs-light`

###### The Cliffs Dark (Still)
`./set-desktop.sh cliffs-dark`

###### The Lake Dynamic
`./set-desktop.sh lake`

###### The Lake Light (Still)
`./set-desktop.sh lake-light`

###### The Lake Dark (Still)
`./set-desktop.sh lake-dark`

###### The Desert Dynamic
`./set-desktop.sh desert`

###### The Desert Light (Still)
`./set-desktop.sh desert-light`

###### The Desert Dark (Still)
`./set-desktop.sh desert-dark`

###### The Beach Dynamic
`./set-desktop.sh beach`

###### The Beach Light (Still)
`./set-desktop.sh beach-light`

###### The Beach Dark (Still)
`./set-desktop.sh beach-dark`

###### Solar Gradients
`./set-desktop.sh solar`

##### Light and Dark Desktop

Setting the image to *Automatic* (e.g. Peak Automatic) ensures it conforms to the *Light*, *Dark* or *Auto* setting in **System Preferences** > **General** > **Appearance**.

###### Big Sur Graphic Automatic
`./set-desktop.sh graphic`

###### Big Sur Graphic Light (Still)
`./set-desktop.sh light`

###### Big Sur Graphic Dark (Still)
`./set-desktop.sh dark`

###### Peak Automatic
`./set-desktop.sh peak`

###### Peak Light (Still)
`./set-desktop.sh peak-light`

###### Peak Dark (Still)
`./set-desktop.sh peak-dark`

###### Tree Automatic
`./set-desktop.sh tree`

###### Tree Light (Still)
`./set-desktop.sh tree-light`

###### Tree Dark (Still)
`./set-desktop.sh tree-dark`

###### Valley Automatic
`./set-desktop.sh valley`

###### Valley Light (Still)
`./set-desktop.sh valley-light`

###### Valley Dark (Still)
`./set-desktop.sh valley-dark`

###### Dome Automatic
`./set-desktop.sh dome`

###### Dome Light (Still)
`./set-desktop.sh dome-light`

###### Dome Dark (Still)
`./set-desktop.sh dome-dark`

###### Iridescence Automatic
`./set-desktop.sh iridescence`

###### Iridescence Light (Still)
`./set-desktop.sh iridescence-light`

###### Iridescence Dark (Still)
`./set-desktop.sh iridescence-dark`

##### Desktop Pictures

###### Big Sur Mountains
`./set-desktop.sh mountains`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Mountains.heic"`

###### Big Sur Aerial
`./set-desktop.sh aerial`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Aerial.heic"`

###### Big Sur Horizon
`./set-desktop.sh horizon`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Horizon.heic"`

###### Big Sur Coastline
`./set-desktop.sh coastline`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Coastline.heic"`

###### Big Sur Shore Rocks
`./set-desktop.sh shore`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Shore Rocks.heic"`

###### Big Sur Water's Edge
`./set-desktop.sh edge`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Waters Edge.heic"`

###### Big Sur Road
`./set-desktop.sh road`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Road.heic"`

###### Big Sur Night Succulents
`./set-desktop.sh succulents`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Night Succulents.heic"`

###### Big Sur Night Grasses
`./set-desktop.sh grasses`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Big Sur Night Grasses.heic"`

###### Catalina Coast
`./set-desktop.sh coast`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Coast.heic"`

###### Catalina Evening
`./set-desktop.sh evening`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Evening.heic"`

###### Catalina Rock
`./set-desktop.sh rock`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Rock.heic"`

###### Catalina Shoreline
`./set-desktop.sh shoreline`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Shoreline.heic"`

###### Catalina Clouds
`./set-desktop.sh clouds`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Clouds.heic"`

###### Catalina Silhouette
`./set-desktop.sh silhouette`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Silhouette.heic"`

###### Catalina Sunset
`./set-desktop.sh sunset`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Sunset.heic"`

###### Light Stream Red
`./set-desktop.sh stream-red`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Light Stream Red.heic"`

###### Light Stream Blue
`./set-desktop.sh stream-blue`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Light Stream Blue.heic"`

###### Light Stream Pink
`./set-desktop.sh stream-pink`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Light Stream Pink.heic"`

###### Light Stream Green
`./set-desktop.sh stream-green`<br />
`./set-desktop.sh "/System/Library/Desktop Pictures/Light Stream Green.heic"`

#### Colours

###### Turquoise Green
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Turquoise Green.png"`

###### Cyan
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Cyan.png"`

###### Blue Violet
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Blue Violet.png"`

###### Yellow
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Yellow.png"`

###### Plum
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Plum.png"`

###### Soft Pink
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Soft Pink.png"`

###### Red Orange
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Red Orange.png"`

###### Ocher
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Ocher.png"`

###### Dusty Rose
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Dusty Rose.png"`

###### Electric Blue
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Electric Blue.png"`

###### Teal
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Teal.png"`

###### Stone
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Stone.png"`

###### Silver
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Silver.png"`

###### Space Grey
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Space Gray.png"`

###### Space Grey Pro
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Space Gray Pro.png"`

###### Gold
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Gold.png"`

###### Gold 2
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Gold 2.png"`

###### Rose Gold
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Rose Gold.png"`

###### Black
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Black.png"`

#### Other

###### Default
`./set-desktop.sh default`

###### General
`./set-desktop.sh "/path/to/desktop/image.jpg"`

## Error Messages

###### Not running macOS 10.14 Mojave or later
`ERROR: For use with macOS 10.14 Mojave or later.`

###### No Desktop image passed on the command line
`ERROR: No image was specified.`

###### Supplied Desktop image is a file that doesn't exist
`ERROR: </path/to/desktop/image.jpg> doesn't exist.`

###### Invalid option passed on the command line
`ERROR: <option> is not a valid option.`

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

- unsorted in the order they appear in `options.json` use `./options.py --version big-sur`

- sorted by `category` use `./options.py --version big-sur --sort category`

- sorted by `name` use `./options.py --version big-sur --sort name`

- sorted by `option` use `./options.py --version big-sur --sort option`

## Tests

The `set-desktop-big-sur-tests.sh` script in the `Big Sur Tests` directory executes `set-desktop.sh` a given number of times (the default is 5 if omitted), each time passing it an option or filename randomly selected from `desktop-images.txt`.

The intention is to document the state of the `data` and `preferences` tables in the `desktoppicture.db` database after each iteration. Output is written to `set-desktop-big-sur-tests.txt`

To change the Desktop picture 100 times, `cd` into the `Big Sur Tests` directory and type `./set-desktop-big-sur-tests.sh 100`

---

Back to [TOC](README.md#table-of-contents-toc)
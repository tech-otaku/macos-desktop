# macOS 10.15 Catalina

The script `set-desktop-catalina.sh` has been replaced by `set-desktop.sh`.

## Purpose
Set a user's Desktop image in macOS 10.15 Catalina from the command line. See [Limitations](#limitations)

## Minimum Requirements

- macos 10.14 Mojave (macOS 10.15 Catalina required for the examples below to work)
- Bash 3.2 (Catalina ships with 3.2.57)
- Python 2.7 (Catalina ships with 2.7.16)

## Background
An explanation of how Desktop images appear to be managed by macOS since Mojave (10.14) can be found at [Setting the Desktop Image in macOS Mojave From the Command Line](https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line). While this article was written before the release of Catalina, the majority of the information is still relevant.

## Usage
`./set-desktop.sh IMAGE`

`IMAGE` can be either 

- a pre-defined named option
- the path to an image file

See the [Valid Options](#valid-options) and [Examples](#examples) sections for more information.

## Examples

These examples use the Apple-supplied Deskop pictures that could otherwise be set via System Preferences. They are categorised and listed as they appear in the Desktop & Screensaver pane as of macOS 10.15.7 Catalina.

### Desktop Pictures

#### Dynamic Desktop

Setting the image to *Dynamic* (e.g. Catalina Dynamic) ensures it changes throughout the day, based on your location.

###### Catalina Dynamic
`./set-desktop.sh catalina`

###### Catalina Light (Still)
`./set-desktop.sh catalina-light`

###### Catalina Dark (Still)
`./set-desktop.sh catalina-dark`

###### Mojave Dynamic
`./set-desktop.sh mojave`

###### Mojave Light (Still)
`./set-desktop.sh mojave-light`

###### Mojave Dark (Still)
`./set-desktop.sh mojave-dark`

###### Solar Gradients
`/set-desktop.sh solar`

#### Desktop Pictures

###### Catalina Day [same as *Catalina Light (Still)*]
`./set-desktop.sh catalina-day`

###### Catalina Night [same as *Catalina Dark (Still)*]
`./set-desktop.sh catalina-night`

###### Catalina Coast
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Coast.heic"`

###### Catalina Evening
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Evening.heic"`

###### Catalina Rock
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Rock.heic"`

###### Catalina Shoreline
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Shoreline.heic"`

###### Catalina Clouds
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Clouds.heic"`

###### Catalina Silhouette
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Silhouette.heic"`

###### Catalina Sunset
`./set-desktop.sh "/System/Library/Desktop Pictures/Catalina Sunset.heic"`

###### Mojave Day [same as *Mojave Light (Still)*]
`./set-desktop.sh mojave-day`

###### Mojave Night [same as *Mojave Dark (Still)*]
`./set-desktop.sh mojave-night`

###### Desert Rock [was *Desert 1* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Desert 1.jpg"`

###### Desert Flats [was *Desert 2* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Desert 2.jpg"`

###### Desert Reflection [was *Desert 3* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Desert 3.jpg"`

###### Desert Rock Formation [was *Desert 4* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Desert 4.jpg"`

###### Desert Dunes [was *Desert 5* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Desert 5.jpg"`

###### Desert Moonlight [was *Desert 6* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Desert 6.jpg"`

###### Desert Night Sky [was *Desert 7* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Desert 7.jpg"`

###### High Sierra
`./set-desktop.sh "/System/Library/Desktop Pictures/High Sierra.jpg"`

###### Sierra
`./set-desktop.sh "/System/Library/Desktop Pictures/Sierra.jpg"`

###### Yosemite Trees [was *Yosemite 3* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Yosemite 3.jpg"`

###### Sierra Peaks [was *Sierra 2* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Sierra 2.jpg"`

###### El Capitan
`./set-desktop.sh "/System/Library/Desktop Pictures/El Capitan.jpg"`

###### Half Dome Night Sky [was *El Capitan 2* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/El Capitan 2.jpg"`

###### Yosemite
`./set-desktop.sh "/System/Library/Desktop Pictures/Yosemite.jpg"`

###### Yosemite Half Dome [was *Yosemite 4* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Yosemite 4.jpg"`

###### Flower Orange [was *Flower 5* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Flower 5.jpg"`

###### Flower Blue [was *Flower 6* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Flower 6.jpg"`

###### Flower Magenta  [was *Flower 7* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Flower 7.jpg"`

###### Flower Purple [was *Flower 8* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Flower 8.jpg"`

###### Flower Pink [was *Flower 9* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Flower 9.jpg"`

###### Flower Teal [was *Flower 10* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Flower 10.jpg"`

###### Reflection Grey [was *Reflection 1* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Reflection 1.jpg"`

###### Reflection Orange [was *Reflection 2* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Reflection 2.jpg"`

###### Reflection Green [was *Reflection 3* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Reflection 3.jpg"`

###### Reflection Purple [was *Reflection 4* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Reflection 4.jpg"`

###### Abstract Blue [was *Abstract 1* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Abstract 1.jpg"`

###### Abstract Green [was *Abstract 2* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Abstract 2.jpg"`

###### Abstract Pink [was *Abstract 3* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Abstract 3.jpg"`

###### Abstract Purple [was *Abstract 4* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Abstract 4.jpg"`

###### Ink Cloud
`./set-desktop.sh "/System/Library/Desktop Pictures/Ink Cloud.jpg"`

###### Colour Burst Purple [was *Color Burst 3* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Color Burst 3.jpg"`

###### Colour Burst Blue [was *Color Burst 2* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Color Burst 2.jpg"`

###### Colour Burst Red [was *Color Burst 1* in macOS Mojave]
`./set-desktop.sh "/System/Library/Desktop Pictures/Color Burst 1.jpg"`

###### Light Stream Red
`./set-desktop.sh "/System/Library/Desktop Pictures/Light Stream Red.heic"`

###### Light Stream Blue
`./set-desktop.sh "/System/Library/Desktop Pictures/Light Stream Blue.heic"`

#### Colours

###### Black
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Black.png"`

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

All valid options and their corresponding data are stored in the file `options.json`. To list these options for Catalina use the following:

- unsorted in the order they appear in `options.json` use `./options.py --version catalina`

- sorted by `category` use `./options.py --version catalina --sort category`

- sorted by `name` use `./options.py --version catalina --sort name`

- sorted by `option` use `./options.py --version catalina --sort option`

## Tests

The `set-desktop-catalina-tests.sh` script in the `Catalina Tests` directory executes `set-desktop.sh` a given number of times (the default is 5 if omitted), each time passing it an option or filename randomly selected from `desktop-images.txt`.

The intention is to document the state of the `data` and `preferences` tables in the `desktoppicture.db` database after each iteration. Output is written to `set-desktop-catalina-tests.txt`

To change the Desktop picture 100 times, `cd` into the `Catalina Tests` directory and type `./set-desktop-catalina-tests.sh 100`

---

Back to [TOC](README.md#table-of-contents-toc)
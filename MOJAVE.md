# macOS 10.14 Mojave

The script `set-desktop-mojave.sh` has been replaced by `set-desktop.sh`.

## Purpose
Set a user's Desktop image in macOS 10.14 Mojave from the command line. See [Limitations](#limitations)

## Minimum Requirements

- macos 10.14 Mojave
- Bash 3.2 (Mojave ships with 3.2.57)
- Python 2.7 (Mojave ships with 2.7.10)

## Background
An explanation for why this script does what it does can be found at [Setting the Desktop Image in macOS Mojave From the Command Line](https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line)

## Instructions 

1. Download [macos-desktop-main.zip](https://github.com/tech-otaku/macos-desktop/archive/refs/heads/main.zip) 

1. Double-click `~/Downloads/macos-desktop-main.zip` in the Finder to unzip it (Safari may do this automatically)

1. Open the Terminal application in macOS

1. At a Terminal prompt:

    - type `cd ~/Downloads/macos-desktop-main` and press enter

    - type `chmod +x set-desktop.sh options.py` and press enter to make the scripts executable

1. See the [Examples](#examples) section for using the `set-desktop.sh` script

1. See the [Valid Options](#valid-options) section for using the `options.py` script


## Usage
`./set-desktop.sh IMAGE`

`IMAGE` can be either 

- a pre-defined named option
- the path to an image file

See the [Valid Options](#valid-options) and [Examples](#examples) sections for more information.

## Examples

These examples use the Apple-supplied Deskop pictures that could otherwise be set via System Preferences. They are categorised and listed as they appear in the Desktop & Screensaver pane as of macOS 10.14.6 Mojave.

See [A Comparison of Apple-supplied Desktop Images Since macOS 10.14 Mojave](https://desktop.tech-otaku.com/)

### Desktop Pictures

#### Dynamic Desktop

Setting the image to *Dynamic* (e.g. Mojave Dynamic) ensures it changes throughout the day, based on your location.

###### Mojave Dynamic
`./set-desktop.sh mojave`

###### Mojave Light (Still)
`./set-desktop.sh mojave-light`

###### Mojave Dark (Still)
`./set-desktop.sh mojave-dark`

###### Solar Gradients
`./set-desktop.sh solar`

#### Desktop Pictures

###### Mojave Day
`./set-desktop.sh "/Library/Desktop Pictures/Mojave Day.jpg"`

###### Mojave Night
`./set-desktop.sh "/Library/Desktop Pictures/Mojave Night.jpg"`

###### Desert 1
`./set-desktop.sh "/Library/Desktop Pictures/Desert 1.jpg"`

###### Desert 2
`./set-desktop.sh "/Library/Desktop Pictures/Desert 2.jpg"`

###### Desert 3
`./set-desktop.sh "/Library/Desktop Pictures/Desert 3.jpg"`

###### Desert 4
`./set-desktop.sh "/Library/Desktop Pictures/Desert 4.jpg"`

###### Desert 5
`./set-desktop.sh "/Library/Desktop Pictures/Desert 5.jpg"`

###### Desert 6
`./set-desktop.sh "/Library/Desktop Pictures/Desert 6.jpg"`

###### Desert 7
`./set-desktop.sh "/Library/Desktop Pictures/Desert 7.jpg"`

###### High Sierra
`./set-desktop.sh "/Library/Desktop Pictures/High Sierra.jpg"`

###### Sierra
`./set-desktop.sh "/Library/Desktop Pictures/Sierra.jpg"`

###### Sierra 2
`./set-desktop.sh "/Library/Desktop Pictures/Sierra 2.jpg"`

###### El Capitan
`./set-desktop.sh "/Library/Desktop Pictures/El Capitan.jpg"`

###### El Capitan 2
`./set-desktop.sh "/Library/Desktop Pictures/El Capitan 2.jpg"`

###### Yosemite
`./set-desktop.sh "/Library/Desktop Pictures/Yosemite.jpg"`

###### Yosemite 3
`./set-desktop.sh "/Library/Desktop Pictures/Yosemite 3.jpg"`

###### Yosemite 4
`./set-desktop.sh "/Library/Desktop Pictures/Yosemite 4.jpg"`

###### Color Burst 1
`./set-desktop.sh "/Library/Desktop Pictures/Color Burst 1.jpg"`

###### Color Burst 2
`./set-desktop.sh "/Library/Desktop Pictures/Color Burst 2.jpg"`

###### Color Burst 3
`./set-desktop.sh "/Library/Desktop Pictures/Color Burst 3.jpg"`

###### Abstract 1
`./set-desktop.sh "/Library/Desktop Pictures/Abstract 1.jpg"`

###### Abstract 2
`./set-desktop.sh "/Library/Desktop Pictures/Abstract 2.jpg"`

###### Abstract 3
`./set-desktop.sh "/Library/Desktop Pictures/Abstract 3.jpg"`

###### Abstract 4
`./set-desktop.sh "/Library/Desktop Pictures/Abstract 4.jpg"`

###### Flower 1
`./set-desktop.sh "/Library/Desktop Pictures/Flower 1.jpg"`

###### Flower 2
`./set-desktop.sh "/Library/Desktop Pictures/Flower 2.jpg"`

###### Flower 3
`./set-desktop.sh "/Library/Desktop Pictures/Flower 3.jpg"`

###### Flower 4
`./set-desktop.sh "/Library/Desktop Pictures/Flower 4.jpg"`

###### Chroma 1
`./set-desktop.sh "/Library/Desktop Pictures/Chroma 1.jpg"`

###### Chroma 2
`./set-desktop.sh "/Library/Desktop Pictures/Chroma 2.jpg"`

###### Abstract Shapes
`./set-desktop.sh "/Library/Desktop Pictures/Abstract Shapes.jpg"`

###### Abstract Shapes 2
`./set-desktop.sh "/Library/Desktop Pictures/Abstract Shapes 2.jpg"`

###### Reflection 1
`./set-desktop.sh "/Library/Desktop Pictures/Reflection 1.jpg"`

###### Reflection 2
`./set-desktop.sh "/Library/Desktop Pictures/Reflection 2.jpg"`

###### Reflection 3
`./set-desktop.sh "/Library/Desktop Pictures/Reflection 3.jpg"`

###### Reflection 4
`./set-desktop.sh "/Library/Desktop Pictures/Reflection 4.jpg"`

###### Flower 5
`./set-desktop.sh "/Library/Desktop Pictures/Flower 5.jpg"`

###### Flower 6
`./set-desktop.sh "/Library/Desktop Pictures/Flower 6.jpg"`

###### Flower 7
`./set-desktop.sh "/Library/Desktop Pictures/Flower 7.jpg"`

###### Flower 8
`./set-desktop.sh "/Library/Desktop Pictures/Flower 8.jpg"`

###### Flower 9
`./set-desktop.sh "/Library/Desktop Pictures/Flower 9.jpg"`

###### Flower 10
`./set-desktop.sh "/Library/Desktop Pictures/Flower 10.jpg"`

###### Ink Cloud
`./set-desktop.sh "/Library/Desktop Pictures/Ink Cloud.jpg"`

### Colours

###### Black
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Black.png"`

###### Turquoise Green
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Turquoise Green.png"`

###### Cyan
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Cyan.png"`

###### Blue Violet
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Blue Violet.png"`

###### Yellow
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Yellow.png"`

###### Plum
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Plum.png"`

###### Soft Pink
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Soft Pink.png"`

###### Red Orange
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Red Orange.png"`

###### Ocher
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Ocher.png"`

###### Dusty Rose
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Dusty Rose.png"`

###### Electric Blue
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Electric Blue.png"`

###### Teal
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Teal.png"`

###### Stone
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Stone.png"`

###### Silver
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Silver.png"`

###### Space Grey
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Space Gray.png"`

###### Space Grey Pro
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Space Gray Pro.png"`

###### Gold
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Gold.png"`

###### Gold 2
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Gold 2.png"`

###### Rose Gold
`./set-desktop.sh "/Library/Desktop Pictures/Solid Colors/Rose Gold.png"`


#### Other

###### Default
`./set-desktop.sh default`

###### General
`./set-desktop.sh "/path/to/desktop/image.jpg"`

## Error Messages

###### Not running macOS Mojave or later
`ERROR: For use with macOS 10.14 Mojave or later.`

###### The configuration file is missing
`ERROR: Can't find configuration file 'options.json'.`

###### No Desktop image passed on the command line
`ERROR: No image was specified.`

###### Supplied Desktop image is a file that doesn't exist
`ERROR: '/path/to/desktop/image.jpg' doesn't exist.`

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

All valid options and their corresponding data are stored in the file `options.json`. To list these options for Mojave use the following:

<ins>NOTE:</ins> The script is parsed by a Python 3 binary, but macOS Mojave only ships with Python 2. To run the script with Python 2 the path to the Python 2 binary - typically `/usr/bin/python` - is included on the command line.

- unsorted in the order they appear in `options.json` use `/usr/bin/python options.py --version mojave`

- sorted by `category` use `/usr/bin/python options.py --version mojave --sort category`

- sorted by `name` use `/usr/bin/python options.py --version mojave --sort name`

- sorted by `option` use `/usr/bin/python options.py --version mojave --sort option`



---

Back to [TOC](README.md#table-of-contents-toc)
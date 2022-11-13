# macOS 13 Ventura

[^1]: If the image doesn't exist it will be downloaded to the `$HOME/Library/Application Support/com.apple.mobileAssetDesktop/` directory first.

## Purpose
Set a user's Desktop image in macOS 13 Ventura from the command line. See [Limitations](#limitations)

## Minimum Requirements

- macos 10.14 Mojave (macOS 13 Ventura required for the examples below to work)
- Bash 3.2 (Ventura ships with 3.2.57)
- Python 2.7 (Ventura ships with 3.9.6)

## Background
An explanation of how Desktop images appear to be managed by macOS since Mojave (10.14) can be found at [Setting the Desktop Image in macOS Mojave From the Command Line](https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line). While this article was written before the release of Ventura, the majority of the information is still relevant. 

## Instructions 

1. Download [macos-desktop-main.zip](https://github.com/tech-otaku/macos-desktop/archive/refs/heads/main.zip) 

1. Double-click `~/Downloads/macos-desktop-main.zip` in the Finder to unzip it (Safari may do this automatically)

1. Open the Terminal application in macOS

1. At a Terminal prompt:

    - type `cd ~/Downloads/macos-desktop-main` and press enter

    - type `chmod +x set-desktop.sh` and press enter to make the script executable

    - type `chmod +x options.py` and press enter to make the script executable

    - type `chmod +x Ventura\ Tests/set-desktop-Ventura-tests.sh` and press enter to make the script executable

1. See the [Examples](#examples) section for using the `set-desktop.sh` script

1. See the [Valid Options](#valid-options) section for using the `options.py` script

1. See the [Tests](#tests) section for using the `set-desktop-Ventura-tests.sh` script

## Usage
`./set-desktop.sh IMAGE`

`IMAGE` can be either 

- a pre-defined named option
- the path to an image file

See the [Valid Options](#valid-options) and [Examples](#examples) sections for more information.

## Examples

These examples use the Apple-supplied Deskop pictures that could otherwise be set via System Settings. They are categorised and listed as they appear in the Wallpaper pane as of macOS 13 Ventura.

See [A Comparison of Apple-supplied Desktop Images Since macOS 10.14 Mojave](https://desktop.tech-otaku.com/)

### Desktop Pictures

#### Dynamic Desktop

Setting the image to *Dynamic* (e.g. The Beach Dynamic) ensures it changes throughout the day, based on your location.

###### Ventura Graphic Dynamic
`./set-desktop.sh graphic`

###### Ventura Graphic Light (Still)
`./set-desktop.sh graphic-light`

###### Ventura Graphic Dark (Still)
`./set-desktop.sh graphic-dark`

###### Monterey Graphic Dynamic
`./set-desktop.sh monterey-graphic`

###### Monterey Graphic Light (Still)
`./set-desktop.sh monterey-graphic-light`

###### Monterey Graphic Dark (Still)
`./set-desktop.sh monterey-graphic-dark`

###### Big Sur Dynamic  [^1]
`./set-desktop.sh big-sur`

###### Big Sur Light (Still)  [^1]
`./set-desktop.sh big-sur-light`

###### Big Sur Dark (Still)  [^1]
`./set-desktop.sh big-sur-dark`

###### Catalina Dynamic  [^1]
`./set-desktop.sh catalina`

###### Catalina Light (Still)  [^1]
`./set-desktop.sh catalina-light`

###### Catalina Dark (Still)  [^1]
`./set-desktop.sh catalina-dark`

###### The Cliffs Dynamic  [^1]
`./set-desktop.sh cliffs`

###### The Cliffs Light (Still)  [^1]
`./set-desktop.sh cliffs-light`

###### The Cliffs Dark (Still)  [^1]
`./set-desktop.sh cliffs-dark`

###### The Lake Dynamic  [^1]
`./set-desktop.sh lake`

###### The Lake Light (Still)  [^1]
`./set-desktop.sh lake-light`

###### The Lake Dark (Still)  [^1]
`./set-desktop.sh lake-dark`

###### The Desert Dynamic  [^1]
`./set-desktop.sh desert`

###### The Desert Light (Still)  [^1]
`./set-desktop.sh desert-light`

###### The Desert Dark (Still)  [^1]
`./set-desktop.sh desert-dark`

###### The Beach Dynamic  [^1]
`./set-desktop.sh beach`

###### The Beach Light (Still)  [^1]
`./set-desktop.sh beach-light`

###### The Beach Dark (Still)  [^1]
`./set-desktop.sh beach-dark`

###### Solar Gradients  [^1]
`./set-desktop.sh solar`

##### Light and Dark Desktop

Setting the image to *Automatic* (e.g. Peak Automatic) ensures it conforms to the *Light*, *Dark* or *Auto* setting in **System Settings** > **Appearance**.

###### Hello Green Automatic
`./set-desktop.sh green`

###### Hello Green Light (Still)
`./set-desktop.sh green-light`

###### Hello Green Dark (Still)
`./set-desktop.sh green-dark`

###### Hello Yellow Automatic
`./set-desktop.sh yellow`

###### Hello Yellow Light (Still)
`./set-desktop.sh yellow-light`

###### Hello Yellow Dark (Still)
`./set-desktop.sh yellow-dark`

###### Hello Orange Automatic
`./set-desktop.sh orange`

###### Hello Orange Light (Still)
`./set-desktop.sh orange-light`

###### Hello Orange Dark (Still)
`./set-desktop.sh orange-dark`

###### Hello Pink Automatic
`./set-desktop.sh pink`

###### Hello Pink Light (Still)
`./set-desktop.sh pink-light`

###### Hello Pink Dark (Still)
`./set-desktop.sh pink-dark`

###### Hello Purple Automatic
`./set-desktop.sh purple`

###### Hello Purple Light (Still)
`./set-desktop.sh purple-light`

###### Hello Purple Dark (Still)
`./set-desktop.sh purple-dark`

###### Hello Blue Automatic
`./set-desktop.sh blue`

###### Hello Blue Light (Still)
`./set-desktop.sh blue-light`

###### Hello Blue Dark (Still)
`./set-desktop.sh blue-dark`

###### Hello Silver Automatic
`./set-desktop.sh silver`

###### Hello Silver Light (Still)
`./set-desktop.sh silver-light`

###### Hello Silver Dark (Still)
`./set-desktop.sh silver-dark`

###### Big Sur Graphic Automatic
`./set-desktop.sh big-sur-graphic`

###### Big Sur Graphic Light (Still)
`./set-desktop.sh big-sur-graphic-light`

###### Big Sur Graphic Dark (Still)
`./set-desktop.sh big-sur-graphic-dark`

###### Peak Automatic  [^1]
`./set-desktop.sh peak`

###### Peak Light (Still)  [^1]
`./set-desktop.sh peak-light`

###### Peak Dark (Still)  [^1]
`./set-desktop.sh peak-dark`

###### Tree Automatic  [^1]
`./set-desktop.sh tree`

###### Tree Light (Still)  [^1]
`./set-desktop.sh tree-light`

###### Tree Dark (Still)  [^1]
`./set-desktop.sh tree-dark`

###### Valley Automatic  [^1]
`./set-desktop.sh valley`

###### Valley Light (Still)  [^1]
`./set-desktop.sh valley-light`

###### Valley Dark (Still)  [^1]
`./set-desktop.sh valley-dark`

###### Dome Automatic  [^1]
`./set-desktop.sh dome`

###### Dome Light (Still)  [^1]
`./set-desktop.sh dome-light`

###### Dome Dark (Still)  [^1]
`./set-desktop.sh dome-dark`

###### Chroma Red Automatic
`./set-desktop.sh chroma-red`

###### Chroma Red Light (Still)
`./set-desktop.sh chroma-red-light`

###### Chroma Red Dark (Still)
`./set-desktop.sh chroma-red-dark`

###### Chroma Blue Automatic
`./set-desktop.sh chroma-blue`

###### Chroma Blue Light (Still)
`./set-desktop.sh chroma-blue-light`

###### Chroma Blue Dark (Still)
`./set-desktop.sh chroma-blue-dark`

###### Iridescence Automatic  [^1]
`./set-desktop.sh iridescence`

###### Iridescence Light (Still)  [^1]
`./set-desktop.sh iridescence-light`

###### Iridescence Dark (Still)  [^1]
`./set-desktop.sh iridescence-dark`

###### Motion Blue Automatic
`./set-desktop.sh motion-blue`

###### Motion Blue Light (Still)
`./set-desktop.sh motion-blue-light`

###### Motion Blue Dark (Still)
`./set-desktop.sh motion-blue-dark`

###### Motion Green Automatic
`./set-desktop.sh motion-green`

###### Motion Green Light (Still)
`./set-desktop.sh motion-green-light`

###### Motion Green Dark (Still)
`./set-desktop.sh motion-green-dark`

###### Motion Purple Automatic
`./set-desktop.sh motion-purple`

###### Motion Purple Light (Still)
`./set-desktop.sh motion-purple-light`

###### Motion Purple Dark (Still)
`./set-desktop.sh motion-purple-dark`

###### Motion Yellow Automatic
`./set-desktop.sh motion-yellow`

###### Motion Yellow Light (Still)
`./set-desktop.sh motion-yellow-light`

###### Motion Yellow Dark (Still)
`./set-desktop.sh motion-yellow-dark`

##### Desktop Pictures

###### Big Sur Mountains  [^1]
`./set-desktop.sh mountains`

###### Big Sur Aerial  [^1]
`./set-desktop.sh aerial`

###### Big Sur Horizon  [^1]
`./set-desktop.sh horizon`

###### Big Sur Coastline  [^1]
`./set-desktop.sh coastline`

###### Big Sur Shore Rocks  [^1]
`./set-desktop.sh shore`

###### Big Sur Water's Edge  [^1]
`./set-desktop.sh edge`

###### Big Sur Road  [^1]
`./set-desktop.sh road`

###### Big Sur Night Succulents  [^1]
`./set-desktop.sh succulents`

###### Big Sur Night Grasses  [^1]
`./set-desktop.sh grasses`

###### Catalina Coast  [^1]
`./set-desktop.sh coast`

###### Catalina Evening  [^1]
`./set-desktop.sh evening`

###### Catalina Rock  [^1]
`./set-desktop.sh rock`

###### Catalina Shoreline  [^1]
`./set-desktop.sh shoreline`

###### Catalina Clouds  [^1]
`./set-desktop.sh clouds`

###### Catalina Silhouette  [^1]
`./set-desktop.sh silhouette`

###### Catalina Sunset  [^1]
`./set-desktop.sh sunset`

###### Light Stream Red  [^1]
`./set-desktop.sh stream-red`

###### Light Stream Blue  [^1]
`./set-desktop.sh stream-blue`

###### Light Stream Pink  [^1]
`./set-desktop.sh stream-pink`

###### Light Stream Green  [^1]
`./set-desktop.sh stream-green`

###### Studio Desktop
`./set-desktop.sh studio-color`

### Colours

###### Black
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Black.png"`

###### Blue Violet
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Blue Violet.png"`

###### Cyan
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Cyan.png"`

###### Dusty Rose
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Dusty Rose.png"`

###### Electric Blue
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Electric Blue.png"`

###### Gold 2
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Gold 2.png"`

###### Gold
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Gold.png"`

###### Ocher
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Ocher.png"`

###### Plum
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Plum.png"`

###### Red Orange
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Red Orange.png"`

###### Rose Gold
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Rose Gold.png"`

###### Silver
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Silver.png"`

###### Soft Pink
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Soft Pink.png"`

###### Space Grey Pro
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Space Gray Pro.png"`

###### Space Grey
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Space Gray.png"`

###### Stone
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Stone.png"`

###### Teal
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Teal.png"`

###### Turquoise Green
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Turquoise Green.png"`

###### Yellow
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Yellow.png"`
<br />
<br />

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

~~###### Supplied Desktop image file hasn't been downloaded
`ERROR: Please download <desktop picture> via System Preferences first, then re-run this script.`~~

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

All valid options and their corresponding data are stored in the file `options.json`. To list these options for Ventura use the following:

- unsorted in the order they appear in `options.json` use `./options.py --version ventura`

- sorted by `category` use `./options.py --version ventura --sort category`

- sorted by `name` use `./options.py--version ventura --sort name`

- sorted by `option` use `./options.py --version ventura --sort option`

## Tests

The `set-desktop-ventura-tests.sh` script in the `Ventura Tests` directory executes `set-desktop.sh` a given number of times (the default is 5 if omitted), each time passing it an option or filename randomly selected from `desktop-images.txt`.

The intention is to document the state of the `data` and `preferences` tables in the `desktoppicture.db` database after each iteration. Output is written to `set-desktop-ventura-tests.txt`

To change the Desktop picture 100 times, `cd` into the `Ventura Tests` directory and type `./set-desktop-ventura-tests.sh 100`

---

Back to [TOC](README.md#table-of-contents-toc)
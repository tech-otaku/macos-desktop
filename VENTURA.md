# macOS 13 Ventura

## Purpose
Set a user's Desktop wallpaper in macOS 13 Ventura from the command line. See [Limitations](#limitations)

## Minimum Requirements

- macos 10.14 Mojave (macOS 13 Ventura required for the examples below to work)
- Bash 3.2 (Ventura ships with 3.2.57)
- Python 2.7 (Ventura ships with 3.9.6)

## Background
An explanation of how Desktop wallpapers appear to be managed by macOS since Mojave (10.14) can be found at [Setting the Desktop Image in macOS Mojave From the Command Line](https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line). While this article was written before the release of Ventura, the majority of the information is still relevant. 

## Instructions 

1. Download [macos-desktop-main.zip](https://github.com/tech-otaku/macos-desktop/archive/refs/heads/main.zip) 

1. Double-click `~/Downloads/macos-desktop-main.zip` in the Finder to unzip it (Safari may do this automatically)

1. Open the Terminal application in macOS

1. At a Terminal prompt:

    - type `cd ~/Downloads/macos-desktop-main` and press enter

    - type `chmod +x set-desktop.sh options.py Ventura\ Tests/set-desktop-ventura-tests.sh` and press enter to make the scripts executable

1. See the [Examples](#examples) section for using the `set-desktop.sh` script

1. See the [Valid Options](#valid-options) section for using the `options.py` script

1. See the [Tests](#tests) section for using the `set-desktop-ventura-tests.sh` script

## Usage
`./set-desktop.sh WALLPAPER`

`WALLPAPER` can be either 

- a pre-defined named option
- the path to an image file

See the [Valid Options](#valid-options) and [Examples](#examples) sections for more information.

## Examples

These examples use the Apple-supplied Deskop pictures that could otherwise be set via System Settings. They are categorised and listed as they appear in the Wallpaper pane as of macOS 13 Ventura.

See [A Comparison of Apple-supplied Desktop Wallpapers Since macOS 10.14 Mojave](https://desktop.tech-otaku.com/)

### Wallpaper

#### Dynamic Desktop

Setting the wallpaper to *Dynamic* (e.g. The Beach Dynamic) ensures it changes throughout the day, based on your location.

###### Ventura Graphic Dynamic
`./set-desktop.sh graphic`

###### Ventura Graphic Light (Still)
`./set-desktop.sh light`

###### Ventura Graphic Dark (Still)
`./set-desktop.sh dark`

###### Monterey Graphic Dynamic
`./set-desktop.sh monterey-graphic`

###### Monterey Graphic Light (Still)
`./set-desktop.sh monterey-graphic-light`

###### Monterey Graphic Dark (Still)
`./set-desktop.sh monterey-graphic-dark`

###### Big Sur Dynamic <sup>**1**</sup>
`./set-desktop.sh big-sur`

###### Big Sur Light (Still) <sup>**1**</sup>
`./set-desktop.sh big-sur-light`

###### Big Sur Dark (Still) <sup>**1**</sup>
`./set-desktop.sh big-sur-dark`

###### Catalina Dynamic <sup>**1**</sup>
`./set-desktop.sh catalina`

###### Catalina Light (Still) <sup>**1**</sup>
`./set-desktop.sh catalina-light`

###### Catalina Dark (Still) <sup>**1**</sup>
`./set-desktop.sh catalina-dark`

###### The Cliffs Dynamic <sup>**1**</sup>
`./set-desktop.sh cliffs`

###### The Cliffs Light (Still) <sup>**1**</sup>
`./set-desktop.sh cliffs-light`

###### The Cliffs Dark (Still) <sup>**1**</sup>
`./set-desktop.sh cliffs-dark`

###### The Lake Dynamic <sup>**1**</sup>
`./set-desktop.sh lake`

###### The Lake Light (Still) <sup>**1**</sup>
`./set-desktop.sh lake-light`

###### The Lake Dark (Still) <sup>**1**</sup>
`./set-desktop.sh lake-dark`

###### The Desert Dynamic <sup>**1**</sup>
`./set-desktop.sh desert`

###### The Desert Light (Still) <sup>**1**</sup>
`./set-desktop.sh desert-light`

###### The Desert Dark (Still) <sup>**1**</sup>
`./set-desktop.sh desert-dark`

###### The Beach Dynamic <sup>**1**</sup>
`./set-desktop.sh beach`

###### The Beach Light (Still) <sup>**1**</sup>
`./set-desktop.sh beach-light`

###### The Beach Dark (Still) <sup>**1**</sup>
`./set-desktop.sh beach-dark`

###### Solar Gradients <sup>**1**</sup>
`./set-desktop.sh solar`

#### Light & Dark Desktop

Setting the wallpaper to *Automatic* (e.g. Peak Automatic) ensures it conforms to the *Light*, *Dark* or *Auto* setting in **System Settings** > **Appearance**.

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

###### Peak Automatic <sup>**1**</sup>
`./set-desktop.sh peak`

###### Peak Light (Still) <sup>**1**</sup>
`./set-desktop.sh peak-light`

###### Peak Dark (Still) <sup>**1**</sup>
`./set-desktop.sh peak-dark`

###### Tree Automatic <sup>**1**</sup>
`./set-desktop.sh tree`

###### Tree Light (Still) <sup>**1**</sup>
`./set-desktop.sh tree-light`

###### Tree Dark (Still) <sup>**1**</sup>
`./set-desktop.sh tree-dark`

###### Valley Automatic <sup>**1**</sup>
`./set-desktop.sh valley`

###### Valley Light (Still) <sup>**1**</sup>
`./set-desktop.sh valley-light`

###### Valley Dark (Still) <sup>**1**</sup>
`./set-desktop.sh valley-dark`

###### Dome Automatic <sup>**1**</sup>
`./set-desktop.sh dome`

###### Dome Light (Still) <sup>**1**</sup>
`./set-desktop.sh dome-light`

###### Dome Dark (Still) <sup>**1**</sup>
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

###### Iridescence Automatic <sup>**1**</sup>
`./set-desktop.sh iridescence`

###### Iridescence Light (Still) <sup>**1**</sup>
`./set-desktop.sh iridescence-light`

###### Iridescence Dark (Still) <sup>**1**</sup>
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

###### Big Sur Mountains <sup>**1**</sup>
`./set-desktop.sh mountains`

###### Big Sur Aerial <sup>**1**</sup>
`./set-desktop.sh aerial`

###### Big Sur Horizon <sup>**1**</sup>
`./set-desktop.sh horizon`

###### Big Sur Coastline <sup>**1**</sup>
`./set-desktop.sh coastline`

###### Big Sur Shore Rocks <sup>**1**</sup>
`./set-desktop.sh shore`

###### Big Sur Water's Edge <sup>**1**</sup>
`./set-desktop.sh edge`

###### Big Sur Road <sup>**1**</sup>
`./set-desktop.sh road`

###### Big Sur Night Succulents <sup>**1**</sup>
`./set-desktop.sh succulents`

###### Big Sur Night Grasses <sup>**1**</sup>
`./set-desktop.sh grasses`

###### Catalina Coast <sup>**1**</sup>
`./set-desktop.sh coast`

###### Catalina Evening <sup>**1**</sup>
`./set-desktop.sh evening`

###### Catalina Rock <sup>**1**</sup>
`./set-desktop.sh rock`

###### Catalina Shoreline <sup>**1**</sup>
`./set-desktop.sh shoreline`

###### Catalina Clouds <sup>**1**</sup>
`./set-desktop.sh clouds`

###### Catalina Silhouette <sup>**1**</sup>
`./set-desktop.sh silhouette`

###### Catalina Sunset <sup>**1**</sup>
`./set-desktop.sh sunset`

###### Light Stream Red <sup>**1**</sup>
`./set-desktop.sh stream-red`

###### Light Stream Blue <sup>**1**</sup>
`./set-desktop.sh stream-blue`

###### Light Stream Pink <sup>**1**</sup>
`./set-desktop.sh stream-pink`

###### Light Stream Green <sup>**1**</sup>
`./set-desktop.sh stream-green`

###### Studio Color
`./set-desktop.sh studio-color`

#### Colors

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
<sup>**1**</sup> If the image file doesn't exist it will be downloaded to the `$HOME/Library/Application Support/com.apple.mobileAssetDesktop/` directory first.

#### Other

###### Default
`./set-desktop.sh default`

###### General
`./set-desktop.sh "/path/to/wallpaper/image.jpg"`

## Error Messages

###### Not running macOS 10.14 Mojave or later
`ERROR: For use with macOS 10.14 Mojave or later.`

###### The configuration file is missing
`ERROR: Can't find configuration file 'options.json'.`

###### No Desktop wallpaper passed on the command line
`ERROR: No image was specified.`

###### Supplied Desktop wallpaper is a file that doesn't exist
`ERROR: </path/to/desktop/wallpaper.jpg> doesn't exist.`

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
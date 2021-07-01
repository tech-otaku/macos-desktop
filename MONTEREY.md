# macOS 12 Monterey

## Purpose
Set a user's Desktop image in macOS 12 Monterey from the command line. See [Limitations](#limitations)

## Background
An explanation of how Desktop images appear to be managed by macOS since Mojave (10.14) can be found at [Setting the Desktop Image in macOS Mojave From the Command Line](https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line). While this article was written before the release of the Monterey Beta, the majority is still relevant to 12. 

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

###### macOS Graphic Automatic
`[bash] ./set-desktop.sh graphic`

###### macOS Graphic Dark (Still)
`[bash] ./set-desktop.sh dark`

###### macOS Graphic Light (Still)
`[bash] ./set-desktop.sh light`

###### Big Sur Graphic Automatic
`[bash] ./set-desktop.sh big-sur-graphic`

###### Big Sur Graphic Dark (Still)
`[bash] ./set-desktop.sh big-sur-graphic-dark`

###### Big Sur Graphic Light (Still)
`[bash] ./set-desktop.sh big-sur-graphic-light `

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

###### Big Sur Aerial
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/972d7a8db8ba601e496e1294aae04124046c1908.asset/Big Sur Aerial.heic"`

###### Big Sur Coastline
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/cf8e4fef996d7b6e9b7d223a7a732a9dc96e908f.asset/Big Sur Coastline.heic"`

###### Big Sur Horizon
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/237a25a78324e57274dd0ea40d8bd895481a1613.asset/Big Sur Horizon.heic"`

###### Big Sur Mountains
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/0b55533c35ad0c1c5ff89e983539a44faf859c07.asset/Big Sur Mountains.heic"`

###### Big Sur Night Grasses
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/5b040b5fecb84d2766a94ef5a14bd5efa2fbcde3.asset/Big Sur Night Grasses.heic"`

###### Big Sur Night Succulents
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/0ffac9759762068a7ab8dfb650a1a19ef7093b46.asset/Big Sur Night Succulents.heic"`

###### Big Sur Road
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/15709d3247a0ceaf9d309339950487b47f9b44bb.asset/Big Sur Road.heic"`

###### Big Sur Shore Rocks
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/17b0ec7a80a6547175ce3acd4c8abbb8615f7f03.asset/Big Sur Shore Rocks.heic"`

###### Big Sur Water's Edge
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/6b9eee9947acbe5c4b04aac87ac375602fce8ca3.asset/Big Sur Waters Edge.heic"`

###### Catalina Clouds
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/f72f29b3fd3625a6b61bc672d35a32f464640a64.asset/Catalina Clouds.heic"`

###### Catalina Coast
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/b783f7498e002b0aa3a2759a5df26f8f428b649d.asset/Catalina Coast.heic"`

###### Catalina Evening
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/1479b2d222bc2ebe51fc4d73b06e4fa8c1ce0e5c.asset/Catalina Evening.heic"`

###### Catalina Rock
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/1a56f27cffc35c1c0d6332e586ee48d68aaaebd9.asset/Catalina Rock.heic"`

###### Catalina Shoreline
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/d9e5318549521fb59354b96d0b2dd9ec123597a9.asset/Catalina Shoreline.heic"`

###### Catalina Silhouette
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/aa4f359601cb1a549369ae5c40cb23826af4dd40.asset/Catalina Silhouette.heic"`

###### Catalina Sunset
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/c8db91583c4eeffd413c3069f021f95df64d0e4e.asset/Catalina Sunset.heic"`

###### Light Stream Blue
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/11a3d5c273194adc64529578ce3edb5c55aa20bd.asset/Light Stream Blue.heic"`

###### Light Stream Green
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/a29e422ecde57671ce8bab2a61587cb01211fa07.asset/Light Stream Green.heic"`

###### Light Stream Pink
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/06413a4489c03a522ff78f78248bfd3975eaa45c.asset/Light Stream Pink.heic"`

###### Light Stream Red
`[bash] ./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/9f458f803afa5a5349aabc6581e2ab155bcc7677.asset/Light Stream Red.heic"`

#### Other

###### Default
`[bash] ./set-desktop.sh default`

##### HEIF (.heic) images
###### hello Green
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/hello Green.heic"`

##### non-HEIF (.heic) images
###### Electric Blue
`[bash] ./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Electric Blue.png"`

## Error Messages

###### Not running macOS 10.15 Catalina or later
`ERROR: For use only with macOS 10.15 Catalina or later.`

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

All valid options and their corresponding data are stored in the file `options.json`. To list these options for Monterey use the following:

- unsorted in the order they appear in `options.json` use `[python] ./options.py --version monterey`

- sorted by `category` use `[python] ./options.py --sort category --version monterey`

- sorted by `name` use `[python] ./options.py --sort name --version monterey`

- sorted by `option` use `[python] ./options.py --sort option --version monterey`

## Tests

The `set-desktop-monterey-tests.sh` script in the `Monterey Tests` directory executes `set-desktop.sh` a given number of times (the default is 5 if omitted), each time passing it an option or filename randomly selected from `desktop-images.txt`.

The intention is to document the state of the `data` and `preferences` tables in the `desktoppicture.db` database after each iteration. Output is written to `set-desktop-monterey-tests.txt`

To change the Desktop picture 100 times, `cd` into the `Monterey Tests` directory and type `[bash] ./set-desktop-monterey-tests.sh 100`

---

Back to [TOC](README.md#table-of-contents-toc)
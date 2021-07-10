# macOS 12 Monterey

Read [Changes Since macOS 11.4 Big Sur](#changes-since-macos-114-big-sur) first.

## Purpose
Set a user's Desktop image in macOS 12 Monterey from the command line. See [Limitations](#limitations)

## Background
An explanation of how Desktop images appear to be managed by macOS since Mojave (10.14) can be found at [Setting the Desktop Image in macOS Mojave From the Command Line](https://www.tech-otaku.com/mac/setting-desktop-image-macos-mojave-from-command-line). While this article was written before the release of the Monterey Beta, the majority is still relevant to 12. 

## Instructions 

1. Download [macos-desktop-monterey.zip](https://github.com/tech-otaku/macos-desktop/archive/refs/heads/monterey.zip) <sup>**1**</sup>

1. Double-click `~/Downloads/macos-desktop-monterey.zip` in the Finder to unzip it (Safari may do this automatically)

1. Open the Terminal application in macOS

1. At a Terminal prompt:

    - type `cd ~/Downloads/macos-desktop-monterey` and press enter

    - type `chmod +x set-desktop.sh` and press enter to make the script executable

    - type `chmod +x options.py` and press enter to make the script executable

    - type `chmod +x Monterey\ Tests/set-desktop-monterey-tests.sh` and press enter to make the script executable

1. See the [Examples](#examples) section for using the `set-desktop.sh` script

1. See the [Valid Options](#valid-options) section for using the `options.py` script

1. See the [Tests](#tests) section for using the `set-desktop-monterey-tests.sh` script

<sup>**1**</sup> **IMPORTANT** This is a development version compatible with macOS 10.15 Catalina, macOS 11 Big Sur and macOS 12 Monterey and is currently undergoing testing. For a stable version that is **not** compatible with macOS 12 Monterey use [macos-desktop-master.zip](https://github.com/tech-otaku/macos-desktop/archive/refs/heads/master.zip) instead.

## Usage
`./set-desktop.sh <desktop image>`

## Examples

#### Dynamic Desktop

Setting the image to *Dynamic* (e.g. The Beach Dynamic) ensures it changes throughout the day, based on your location.

##### HEIF (.heic) images

###### The Beach Dynamic
`./set-desktop.sh beach`

###### The Beach Dark (Still)
`./set-desktop.sh beach-dark`

###### The Beach Light (Still)
`./set-desktop.sh beach-light`

###### Big Sur Dynamic
`./set-desktop.sh big-sur`

###### Big Sur Dark (Still)
`./set-desktop.sh big-sur-dark`

###### Big Sur Light (Still)
`./set-desktop.sh big-sur-light`

###### Catalina Dynamic
`./set-desktop.sh catalina`

###### Catalina Dark (Still)
`./set-desktop.sh catalina-dark`

###### Catalina Light (Still)
`./set-desktop.sh catalina-light`

###### The Cliffs Dynamic
`./set-desktop.sh cliffs`

###### The Cliffs Dark (Still)
`./set-desktop.sh cliffs-dark`

###### The Cliffs Light (Still)
`./set-desktop.sh cliffs-light`

###### The Desert Dynamic
`./set-desktop.sh desert`

###### The Desert Dark (Still)
`./set-desktop.sh desert-dark`

###### The Desert Light (Still)
`./set-desktop.sh desert-light`

###### The Lake Dynamic
`./set-desktop.sh lake`

###### The Lake Dark (Still)
`./set-desktop.sh lake-dark`

###### The Lake Light (Still)
`./set-desktop.sh lake-light`

###### Solar Gradients
`./set-desktop.sh solar`

#### Light and Dark Desktop

Setting the image to *Automatic* (e.g. Peak Automatic) ensures it conforms to the *Light*, *Dark* or *Auto* setting in **System Preferences** > **General** > **Appearance**.

##### HEIF (.heic) images

###### Big Sur Graphic Automatic
`./set-desktop.sh big-sur-graphic`

###### Big Sur Graphic Dark (Still)
`./set-desktop.sh big-sur-graphic-dark`

###### Big Sur Graphic Light (Still)
`./set-desktop.sh big-sur-graphic-light`

###### Dome Automatic
`./set-desktop.sh dome`

###### Dome Dark (Still)
`./set-desktop.sh dome-dark`

###### Dome Light (Still)
`./set-desktop.sh dome-light`

###### Hello Blue Automatic
`./set-desktop.sh blue`

###### Hello Blue Dark (Still)
`./set-desktop.sh blue-dark`

###### Hello Blue Light (Still)
`./set-desktop.sh blue-light`

###### Hello Green Automatic
`./set-desktop.sh green`

###### Hello Green Dark (Still)
`./set-desktop.sh green-dark`

###### Hello Green Light (Still)
`./set-desktop.sh green-light`

###### Hello Orange Automatic
`./set-desktop.sh orange`

###### Hello Orange Dark (Still)
`./set-desktop.sh orange-dark`

###### Hello Orange Light (Still)
`./set-desktop.sh orange-light`

###### Hello Pink Automatic
`./set-desktop.sh pink`

###### Hello Pink Dark (Still)
`./set-desktop.sh pink-dark`

###### Hello Pink Light (Still)
`./set-desktop.sh pink-light`

###### Hello Purple Automatic
`./set-desktop.sh purple`

###### Hello Purple Dark (Still)
`./set-desktop.sh purple-dark`

###### Hello Purple Light (Still)
`./set-desktop.sh purple-light`

###### Hello Silver Automatic
`./set-desktop.sh silver`

###### Hello Silver Dark (Still)
`./set-desktop.sh silver-dark`

###### Hello Silver Light (Still)
`./set-desktop.sh silver-light`

###### Hello Yellow Automatic
`./set-desktop.sh yellow`

###### Hello Yellow Dark (Still)
`./set-desktop.sh yellow-dark`

###### Hello Yellow Light (Still)
`./set-desktop.sh yellow-light`



###### Iridescence Automatic
`./set-desktop.sh iridescence`

###### Iridescence Dark (Still)
`./set-desktop.sh iridescence-dark`

###### Iridescence Light (Still)
`./set-desktop.sh iridescence-light`

###### macOS Graphic Automatic
`./set-desktop.sh graphic`

###### macOS Graphic Dark (Still)
`./set-desktop.sh dark`

###### macOS Graphic Light (Still)
`./set-desktop.sh light`

###### Peak Automatic
`./set-desktop.sh peak`

###### Peak Dark (Still)
`./set-desktop.sh peak-dark`

###### Peak Light (Still)
`./set-desktop.sh peak-light`

###### Tree Automatic
`./set-desktop.sh tree`

###### Tree Dark (Still)
`./set-desktop.sh tree-dark`

###### Tree Light (Still)
`./set-desktop.sh tree-light`

###### Valley Automatic
`./set-desktop.sh valley`

###### Valley Dark (Still)
`./set-desktop.sh valley-dark`

###### Valley Light (Still)
`./set-desktop.sh valley-light`

#### Desktop Pictures

##### HEIF (.heic) images

###### Big Sur Aerial
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/972d7a8db8ba601e496e1294aae04124046c1908.asset/AssetData/Big Sur Aerial.heic"`

###### Big Sur Coastline
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/cf8e4fef996d7b6e9b7d223a7a732a9dc96e908f.asset/AssetData/Big Sur Coastline.heic"`

###### Big Sur Horizon
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/237a25a78324e57274dd0ea40d8bd895481a1613.asset/AssetData/Big Sur Horizon.heic"`

###### Big Sur Mountains
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/0b55533c35ad0c1c5ff89e983539a44faf859c07.asset/AssetData/Big Sur Mountains.heic"`

###### Big Sur Night Grasses
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/5b040b5fecb84d2766a94ef5a14bd5efa2fbcde3.asset/AssetData/Big Sur Night Grasses.heic"`

###### Big Sur Night Succulents
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/0ffac9759762068a7ab8dfb650a1a19ef7093b46.asset/AssetData/Big Sur Night Succulents.heic"`

###### Big Sur Road
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/15709d3247a0ceaf9d309339950487b47f9b44bb.asset/AssetData/Big Sur Road.heic"`

###### Big Sur Shore Rocks
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/17b0ec7a80a6547175ce3acd4c8abbb8615f7f03.asset/AssetData/Big Sur Shore Rocks.heic"`

###### Big Sur Water's Edge
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/6b9eee9947acbe5c4b04aac87ac375602fce8ca3.asset/AssetData/Big Sur Waters Edge.heic"`

###### Catalina Clouds
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/f72f29b3fd3625a6b61bc672d35a32f464640a64.asset/AssetData/Catalina Clouds.heic"`

###### Catalina Coast
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/b783f7498e002b0aa3a2759a5df26f8f428b649d.asset/AssetData/Catalina Coast.heic"`

###### Catalina Evening
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/1479b2d222bc2ebe51fc4d73b06e4fa8c1ce0e5c.asset/AssetData/Catalina Evening.heic"`

###### Catalina Rock
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/1a56f27cffc35c1c0d6332e586ee48d68aaaebd9.asset/AssetData/Catalina Rock.heic"`

###### Catalina Shoreline
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/d9e5318549521fb59354b96d0b2dd9ec123597a9.asset/AssetData/Catalina Shoreline.heic"`

###### Catalina Silhouette
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/aa4f359601cb1a549369ae5c40cb23826af4dd40.asset/AssetData/Catalina Silhouette.heic"`

###### Catalina Sunset
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/c8db91583c4eeffd413c3069f021f95df64d0e4e.asset/AssetData/Catalina Sunset.heic"`

###### Light Stream Blue
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/11a3d5c273194adc64529578ce3edb5c55aa20bd.asset/AssetData/Light Stream Blue.heic"`

###### Light Stream Green
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/a29e422ecde57671ce8bab2a61587cb01211fa07.asset/AssetData/Light Stream Green.heic"`

###### Light Stream Pink
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/06413a4489c03a522ff78f78248bfd3975eaa45c.asset/AssetData/Light Stream Pink.heic"`

###### Light Stream Red
`./set-desktop.sh "/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/9f458f803afa5a5349aabc6581e2ab155bcc7677.asset/AssetData/Light Stream Red.heic"`

#### Other

###### Default
`./set-desktop.sh default`

##### non-HEIF (.heic) images
###### Electric Blue
`./set-desktop.sh "/System/Library/Desktop Pictures/Solid Colors/Electric Blue.png"`

## Error Messages

###### Not running macOS 10.15 Catalina or later
`ERROR: For use with macOS 10.15 Catalina or later.`

###### No Desktop image passed on the command line
`ERROR: No image was specified.`

###### Supplied Desktop image is a file that doesn't exist
`ERROR: </path/to/desktop/image.jpg> doesn't exist.`

###### Supplied Desktop image file hasn't been downloaded
`ERROR: Please download <desktop picture> via System Preferences first, then re-run this script.`

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

All valid options and their corresponding data are stored in the file `options.json`. To list these options for Monterey use the following:

- unsorted in the order they appear in `options.json` use `./options.py --version monterey`

- sorted by `category` use `./options.py --sort category --version monterey`

- sorted by `name` use `./options.py --sort name --version monterey`

- sorted by `option` use `./options.py --sort option --version monterey`

## Tests

The `set-desktop-monterey-tests.sh` script in the `Monterey Tests` directory executes `set-desktop.sh` a given number of times (the default is 5 if omitted), each time passing it an option or filename randomly selected from `desktop-images.txt`.

The intention is to document the state of the `data` and `preferences` tables in the `desktoppicture.db` database after each iteration. Output is written to `set-desktop-monterey-tests.txt`

To change the Desktop picture 100 times, `cd` into the `Monterey Tests` directory and type `./set-desktop-monterey-tests.sh 100`

## Changes Since macOS 11.4 Big Sur

macOS Monterey has introduced some fundamental changes to where Desktop pictures are located and how they are initially created. This has provided some [challenges](#challenges) in changing the `set-desktop.sh` script to support these changes.

### Changes in macOS Monterey Developer Beta 1 [21A5248p]

#### New Desktop Picture Images

* Only one new Desktop picture named **macOS Graphic** is included and is now the default.

* In System Preferences > Desktop & Screensaver > Desktop it is the first thumbnail in the Light and Dark Desktop category. 
    
* There are options for *Automatic*, *Light (Still)* and *Dark* (Still).

* The image file is `/System/Library/Desktop Pictures/macOS Graphic.heic`


#### New `.madesktop` Files

* With the exception of `macOS Graphic.heic` and  `Big Sur Graphic.heic` all images with a `.heic` extension in `/System/Library/Desktop Pictures/` that existed in Big Sur and earlier releases of macOS have been replaced by files with a  `.madesktop` extension e.g. `Catalina.heic` is now `Catalina.madesktop`.

* Each file with a `.madesktop` extension is an XML file containing amongst other data the path to a thumbnail image that is displayed in System Preferences > Desktop & Screensaver > Desktop.

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>mobileAssetID</key>
	<string>Catalina</string>
	<key>thumbnailPath</key>
	<string>/System/Library/Desktop Pictures/.thumbnails/Catalina.heic</string>
    <key>isDynamic</key>
    <true/>
    <key>isSolar</key>
    <true/>
    <key>width</key>
    <real>6016.0</real>
    <key>height</key>
    <real>6016.0</real>
</dict>
</plist>
```
---
<br />

#### Desktop Picture Image Files do not Exist on Fresh Install / Location Changed

* With the exception of `macOS Graphic.heic` and  `Big Sur Graphic.heic` the full size images used for the Desktop pictures no longer exist on a fresh install of macOS Monterey. This is evident from the download icon on each of the Desktop picture thumbnails in System Preferences > Desktop & Screensaver > Desktop. 

* The Desktop picture can only be set to the selected `.heic` image after it has been explicitly downloaded by clicking the download icon.

* The image is no longer located in the `/System/Library/Desktop Pictures/` directory as in previous macOS versions, but a zip file containing the image is downloaded to the `/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/` directory. 

* The URL of the zip file and the name and location of the directory created when it's expanded are stored in  `/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/com_apple_MobileAsset_DesktopPicture.xml`. 

```
<dict>
    ....
    <key>DesktopPictureID</key>
    <string>Catalina</string>
    ....
    <key>__BaseURL</key>
    <string>http://updates-http.cdn-apple.com/2021/mobileassets/071-34545/7E2884C0-2F21-4028-B22E-2EA162B35135/</string>
    ....
    <key>__RelativePath</key>
    <string>com_apple_MobileAsset_DesktopPicture/28e590448a1795ffd7d8ae9c9f826ceedd9696a2.zip</string>
    ....
</dict>
```

* Using `Catalina.heic` as an example:
    * the zip file is located at `__BaseURL` + `__RelativePath`
    * when unzipped, a parent folder named after the zip file is created 

```
/
|-- System/
    |-- Library/
        |-- AssetsV2/
            |-- com_apple_MobileAsset_DesktopPicture/
                |-- 28e590448a1795ffd7d8ae9c9f826ceedd9696a2/ <--- Created when zip file expanded
                    |-- AssetData//
                        |-- Catalina.heic                     <--- Desktop picture
                    |-- Info.plist
                    |-- META-INF/
                        |-- com.apple.ZipMetadata.plist
```

#### Challenges

If the `set-desktop.sh` script is used to set the Desktop picture to say *Catalina Dynamic* and `Catalina.heic` doesn't exist, it first needs to be downloaded and placed in the correct directory (see above). This would be fairly easy to achieve if it weren't for System Integrity Protection (SIP) which prevents the `/System` directory from being written to. 

The options for the script are:

1. Disable SIP first. It is enabled by default and disabling it is not a trivial matter. Not something that the script can do nor perhaps is desirable. ~~N.B. This is how the current version of the script works.~~

2. Have the script use existing Desktop picture image files in the `/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/` and download and place missing Desktop picture image files in a newley-created writable directory say `~/Library/Application Support/AssetsV2/com_apple_MobileAsset_DesktopPicture/Dock`. This is the location of `desktoppicture.db`, the database that stores the current Desktop picture. 

3. Have the script use existing Desktop picture image files in the `/System/Library/AssetsV2/com_apple_MobileAsset_DesktopPicture/` and prompt the user to download any missing image file via System Preferences > Desktop & Screensaver > Desktop. N.B. This is how the current version of the script works.

### Changes in macOS Monterey Developer Beta 2 [21A5268h]

#### New Desktop Picture Images

* New Desktop pictures included in the Light and Dark Desktop Category in System Preferences > Desktop & Screensaver > Desktop:
    * Hello Green (hello Green.heic)
    * Hello Yellow (hello Yellow.heic)
    * Hello Orange (hello Orange.heic)
    * Hello Pink (hello Red.heic)
    * Hello Purple (hello Purple.heic)
    * Hello Blue (hello Blue.heic)
    * Hello Silver (hello Grey.heic)
    
* Like other Desktop pictures in the Light and Dark Desktop category, there are options for *Automatic*, *Light (Still)* and *Dark* (Still).

* The image files are located in the `/System/Library/Desktop Pictures/` directory and do not need to be downloaded via System Preferences. These files have existed in this directory since Big Sur and the release of the new 24" iMac, but this is the first time thay've been included as options in System Preferences.

---

Back to [TOC](README.md#table-of-contents-toc)
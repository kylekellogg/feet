# Feet

A [LÖVE/Love2d](http://love2d.org/) bootstrapper to get you up and standing on your own two feet quickly and easily.

Most [LÖVE/Love2d](http://love2d.org/) libraries use a suggestive name ([see the list here](https://www.love2d.org/wiki/Category:Libraries)) and I was trying to corner the whole foot fetish thing, but I'm not sure that comes across. Better name suggestions are welcome.

## Requirements

You must have [Lua 5.2](http://www.lua.org/) installed. It probably works with 5.1, but I've only tested with 5.2.

If you have [Homebrew](http://brew.sh/) then you can just:
```sh
brew install lua52
```

If you intend to use the `libs` flag, you must also have `curl` installed. Again, if you have [Homebrew](http://brew.sh/) then you can just:
```sh
brew install curl
```

## Installation

### Mac

```sh
curl -fsSL https://raw.github.com/sqow/love-feet/master/main.lua >> /usr/local/bin/feet; chmod a+x /usr/local/bin/feet;
```

### Windows

_Needs to be filled in_

### Linux

_Needs to be filled in_

## Usage

```sh
cd {target directory}
feet .
```

### Optional Arguments

| Arg       | Type      | Default       | Usage     | Description |
| :-------- | :-------- | :------------ | :-------- | :---------- |
| wasd      | bool      | false         | `feet wasd=true` | Autogenerates code to handle WASD key input |
| arrows    | bool      | false         | `feet arrows=true` | Autogenerates code to handle arrow key input |
| keys      | bool      | false         | `feet keys=true` | Autogenerates code to handle WASD and arrow key input |
| title     | string    | ''            | `feet title="Steve Holt!"` | Autogenerates title in conf.lua |
| width     | int       | 800           | `feet width=1024` | Autogenerates width in conf.lua |
| height    | int       | 600           | `feet height=768` | Autogenerates height in conf.lua |
| physics   | bool      | false         | `feet physics=true` | Autogenerates a new physics world with 0 x gravity, 9.81 * 64 y gravity, the ability to sleep and sets a default meter size of 64 |
| meter     | int       | 64            | `feet meter=32` | Will flag physics as true if set to not nil or false. Sets a default meter size. |
| gravity   | int       | 9.81 * meter  | `feet gravity=50` | Will flag physics as true if set to not nil or false. Sets the y gravity and is given preferential treatment over gravityY if that flag is also set. |
| gravityX  | int       | 0             | `feet gravityX=10` | Will flag physics as true if set to not nil or false. Sets the x gravity. |
| gravityY  | int       | 9.81 * meter  | `feet gravityY=75` | Will flag physics as true if set to not nil or false. Sets the y gravity. |
| libs      | string    | nil           | `feet libs=relative-path.lua` | Will automatically acquire, create the necessary directories, and _dumbly_ include the specified libraries. See the [Libs](#libs) section for more info.

You can also chain optional arguments together in a space delimited list for more customization, e.g.
```sh
feet keys=true width=1024 height=768 title="Steve Holt!"
```

#### Libs

The `libs` flag is not extremely smart or exceptionally versatile, but it shouldn't need to be. I've done my best to set it up so that it will work acceptably well for any .lua or .zip fiiles. Really, it should work with any kind of file (file, not archive), but those are what I've targeted.

For .zips, as they're the only archive format I've set it to work with it will acquire the .zip, unzip it to the `./libs/` directory using the target name provided, and, if it has only one child without a file ending (i.e. the .zip was of a singular folder), reparent all the files into the target directory and remove the (now) empty folder.

If you intend to use the `libs` flag, the format for doing so is as follows:
```lua
return {
  {
    source = 'https://github.com/vrld/hump/archive/master.zip',       --  Extract the 'hump-master' folder, reparent all children to 'hump', and remove the 'hump-master folder'
    target = 'hump'
  },
  {
    source = 'https://raw.github.com/Yonaba/30log/master/30log.lua',  --  Straight download and rename, preserving file ending
    target = '30log'
  }
}
```

You can chain any number of these tables together as long as the parent table itself is returned.

All of these will, by default, be added to the `main.lua` file that is generated if the `libs` flag is used at all.

## TODO
- Incorporate [Busted](http://olivinelabs.com/busted/) for testing
- Poll for features that would be useful
- Establish Windows installation
- Establish Linux installation

## Author

This project was created and is maintained by [@kylekellogg](https://twitter.com/kylekellogg)

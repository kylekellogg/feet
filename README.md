# Feet

A [LÖVE](http://love2d.org/) bootstrapper to get you up and standing on your own two feet quickly and easily.

Most [LÖVE](http://love2d.org/) libraries use a suggestive name ([see the list here](https://www.love2d.org/wiki/Category:Libraries)) and I was trying to corner the whole foot fetish thing, but I'm not sure that comes across. Better name suggestions are welcome.

## Requirements

You must have Lua 5.2 installed. It probably works with 5.1, but I've only tested with 5.2.

If you have [Homebrew](http://brew.sh/) then you can just:
```sh
brew install lua52
```

## Installation

### Mac

```sh
curl -fsSl https://raw.github.com/sqow/love-feet/master/main.lua >> /usr/local/bin/feet; chmod a+x /usr/local/bin/feet;
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

| Arg       | Type  | Default       | Usage     | Description |
| :-------- | :---- | :------------ | :-------- | :---------- |
| wasd      | bool  | false         | `feet wasd=true` | Autogenerates code to handle WASD key input |
| arrows    | bool  | false         | `feet arrows=true` | Autogenerates code to handle arrow key input |
| keys      | bool  | false         | `feet keys=true` | Autogenerates code to handle WASD and arrow key input |
| title     | string| ''            | `feet title="Steve Holt!"` | Autogenerates title in conf.lua |
| width     | int   | 800           | `feet width=1024` | Autogenerates width in conf.lua |
| height    | int   | 600           | `feet height=768` | Autogenerates height in conf.lua |
| physics   | bool  | false         | `feet physics=true` | Autogenerates a new physics world with 0 x gravity, 9.81 * 64 y gravity, the ability to sleep and sets a default meter size of 64 |
| meter     | int   | 64            | `feet meter=32` | Will flag physics as true if set to anything. Sets a default meter size. |
| gravity   | int   | 9.81 * meter  | `feet gravity=50` | Will flag physics as true if set to anything. Sets the y gravity and is given preferential treatment over gravityY if that flag is also set. |
| gravityX  | int   | 0             | `feet gravityX=10` | Will flag physics as true if set to anything. Sets the x gravity. |
| gravityY  | int   | 9.81 * meter  | `feet gravityY=75` | Will flag physics as true if set to anything. Sets the y gravity. |

You can also chain optional arguments together in a space delimited list for more customization, e.g.
```sh
feet keys=true width=1024 height=768 title="Steve Holt!"
```

## TODO
- Incorporate [Busted](http://olivinelabs.com/busted/) for testing
- Add physics flag
- Setup physics bootstrapping
- Poll for features that would be useful
- Establish Windows installation
- Establish Linux installation

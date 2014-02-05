# Feet

A [LÖVE](http://love2d.org/) bootstrapper to get you up and standing on your own two feet quickly and easily.

Most [LÖVE](http://love2d.org/) libraries use a suggestive name ([see the list here](https://www.love2d.org/wiki/Category:Libraries)) and I was trying to corner the whole foot fetish thing, but I'm not sure that comes across. Better name suggestions are welcome.

## Requirements

You must have Lua 5.2 installed. It probably works with 5.1, but I've only tested with 5.2.

If you have [Homebrew](http://brew.sh/) then you can just:
```Shell
brew install lua52
```

## Installation

### Mac

```Shell
curl -fsSl https://raw.github.com/sqow/love-feet/master/main.lua >> /usr/local/bin/feet; chmod a+x /usr/local/bin/feet;
```

### Windows

_Needs to be filled in_

### Linux

_Needs to be filled in_

## Usage

```
cd {target directory}
feet .
```

### Optional Arguments

| Arg       | Type  | Default       | Description               | Usage     |
| :-------- | :---- | :------------ | :------------------------ | :-------- |
| wasd      | bool  | false         | <div style="display: inline-block; min-width: 100px">Autogenerates code to handle WASD key input</div> | `feet wasd=true` |
| arrows    | bool  | false         | <div style="display: inline-block; min-width: 100px">Autogenerates code to handle arrow key input</div> | `feet arrows=true` |
| keys      | bool  | false         | <div style="display: inline-block; min-width: 100px">Autogenerates code to handle WASD and arrow key input</div> | `feet keys=true` |
| title     | string| ''            | <div style="display: inline-block; min-width: 100px">Autogenerates title in conf.lua</div> | `feet title="Wrap Titles With Spaces In Quotes"` |
| width     | int   | 800           | <div style="display: inline-block; min-width: 100px">Autogenerates width in conf.lua</div> | `feet width=1024` |
| height    | int   | 600           | <div style="display: inline-block; min-width: 100px">Autogenerates height in conf.lua</div> | `feet height=768` |
| physics   | bool  | false         | <div style="display: inline-block; min-width: 100px">Autogenerates a new physics world with 0 x gravity, 9.81 * 64 y gravity, the ability to sleep and sets a default meter size of 64</div> | `feet physics=true` |
| meter     | int   | 64            | <div style="display: inline-block; min-width: 100px">Will flag physics as true if set to anything. Sets a default meter size.</div> | `feet meter=32` |
| gravity   | int   | 9.81 * meter  | <div style="display: inline-block; min-width: 100px">Will flag physics as true if set to anything. Sets the y gravity and is given preferential treatment over gravityY if that flag is also set.</div> | `feet gravity=50` |
| gravityX  | int   | 0             | <div style="display: inline-block; min-width: 100px">Will flag physics as true if set to anything. Sets the x gravity.</div> | `feet gravityX=10` |
| gravityY  | int   | 9.81 * meter  | <div style="display: inline-block; min-width: 100px">Will flag physics as true if set to anything. Sets the y gravity.</div> | `feet gravityY=75` |

You can also chain optional arguments together in a space delimited list for more customization, e.g.
```
feet keys=true width=1024 height=768 title="Steve Holt!"
```

## TODO
- Incorporate [Busted](http://olivinelabs.com/busted/) for testing
- Add physics flag
- Setup physics bootstrapping
- Poll for features that would be useful
- Establish Windows installation
- Establish Linux installation

# Feet

A LÖVE bootstrapper to get you up and standing on your own two feet quickly and easily.

Most LÖVE libraries use a suggestive name ([see the list here](https://www.love2d.org/wiki/Category:Libraries)) and I was trying to corner the whole foot fetish thing, but I'm not sure that comes across. Better name suggestions are welcome.

## Requirements

You must have Lua 5.2 installed. It probably works with 5.1, but I've only tested with 5.2.

If you have [Homebrew](http://brew.sh/) then you can just:
```
brew install lua52
```

## Installation

### Mac

```
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

- wasd
    (bool)
    defaults to false

    Autogenerates code to handle WASD key input

    usage:
 ```
feet wasd=true
    ```
- arrows
    (bool)
    defaults to false

    Autogenerates code to handle arrow key input

    usage:
 ```
feet arrows=true
    ```
- keys
    (bool)
    defaults to false

    Autogenerates code to handle WASD and arrow key input

    usage:
 ```
feet keys=true
    ```
- title
    (string)
    defaults to ''

    Autogenerates title in conf.lua

    usage:
 ```
feet title="Need to Wrap in Quotes to Preserve Spaces"
    ```
- width
    (int)
    defaults to 800

    Autogenerates width in conf.lua

    usage:
 ```
feet width=1024
    ```
- height
    (int)
    defaults to 600

    Autogenerates height in conf.lua

    usage:
 ```
feet height=768
    ```

You can also chain optional arguments together in a space delimited list for more customization, e.g.
```
feet keys=true width=1024 height=768 title="Steve Holt!"
```

## TODO
- Incorporate Busted for testing
- Add physics flag
- Setup physics bootstrapping
- Poll for features that would be useful
- Establish Windows installation
- Establish Linux installation

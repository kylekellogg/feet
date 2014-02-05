# Feet

A LÖVE bootstrapper to get you up and standing on your own two feet quickly and easily.

## Requirements

_Needs to be filled in_

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
- Establish requirements
- Establish Windows installation
- Establish Linux installation

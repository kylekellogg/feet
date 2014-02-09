#!/usr/bin/env lua

local flags = {
  wasd = false,
  arrows = false,
  keys = false,

  physics = false,
  meter = nil,
  gravityX = nil,
  gravityY = nil,
  gravity = nil,

  title = '',
  width = 800,
  height = 600,

  libs = nil
}

local forceBool = {
  wasd = true,
  arrows = true,
  keys = true,
  physics = true
}

local libsFolder = 'libs'
local fileSeparator = os.tmpname():sub( 1, 1 ) == '\\' and '\\' or '/'
local libs = {}

local a, b, s = nil, nil, nil

local function ensureDirectory( dir )
  local success = os.execute( '[ -d ' .. dir .. ' ]' )
  if not success then
    if not os.execute( 'mkdir ' .. dir ) then
      print( 'Could not make directory ' .. dir )
      return nil
    end
  end
  return true
end

local function ensureLibsDirectory()
  return ensureDirectory( '.' .. fileSeparator .. libsFolder )
end

local function downloadFileTo( source, target )
  return os.execute( 'curl -fsSL ' .. source .. ' -o ' .. target )
end

local function unzipFromTo( source, target )
  ensureDirectory( target )
  return os.execute( 'unzip -q ' .. source .. ' -d ' .. target )
end

local function scanDir( dir )
  local i, t, popen = 0, {}, io.popen
  for filename in popen('ls -a "'..dir..'"'):lines() do
    i = i + 1
    if filename ~= '.' and filename ~= '..' then
      t[#t+1] = filename
    end
  end
  return t
end

local function processLib( lib )
  local source, target, success = lib.source, lib.target, nil
  local filetype = source:sub( -4 )
  local orig = '.' .. fileSeparator .. libsFolder .. fileSeparator .. target .. filetype

  success = downloadFileTo( source, orig )
  if not success then
    print( 'Could not download ' .. source )
  end

  if success and filetype == '.zip' then
    local targ = orig:sub( 1, #orig - #filetype )
    success = unzipFromTo( orig, targ )
    if not success then
      print( 'Could not extract ' .. orig )
    else
      os.remove( orig )
      local t = scanDir( targ )
      if #t == 1 and t[1]:sub( -4, -4 ) ~= '.' and t[1]:sub( -5, -5 ) ~= '.' then
        --  Directory (or a really weird file)
        local badDir = targ .. fileSeparator .. t[1] .. fileSeparator
        os.execute( 'mv ' .. badDir .. '* ' .. targ )
        os.remove( badDir )
      end
      libs[ #libs + 1 ] = targ:sub( 3 )
    end
  elseif success and filetype ~= '.zip' then
    libs[ #libs + 1 ] = libsFolder .. fileSeparator .. target
  end
end

local function processLibs( libs )
  ensureLibsDirectory()

  for k, v in pairs( libs ) do
    processLib( v )
  end
end

--  Reset flags based on user input

for _,v in ipairs( arg ) do
  s = string.find( v, '=' )
  if s then
    a = string.sub( v, 1, s-1 )
    b = string.sub( v, s+1 )

    if forceBool[a] then
      flags[a] = b ~= 'false' and true or false
    else
      if a:lower() == 'libs' then
        flags[a] = dofile( b )
        processLibs( flags[a] )
      else
        flags[a] = b
      end
    end
  end
end

--  Normalize flags

if not flags.physics and (flags.meter or flags.gravityX or flags.gravityY or flags.gravity) ~= nil then
  flags.physics = true
end

flags.meter = flags.meter and tonumber( flags.meter ) or 64
flags.gravityX = flags.gravityX and tonumber( flags.gravityX ) or 0
flags.gravityY = flags.gravity and tonumber( flags.gravity ) or flags.gravityY and tonumber( flags.gravityY ) or tostring( flags.meter )..' * 9.81'

--  File creation

os.execute( 'touch main.lua' )

local mainFile = io.open( 'main.lua', 'w+' )
assert( io.type( mainFile ) == 'file', 'File main.lua was not opened successfully' )

function keyString( lvl, main, alt )
  lvl = lvl and tonumber( lvl ) or 0
  main = main and tostring( main ) or ''
  alt = alt and tostring( alt ) or ''

  local is = "key == '%s'"

  if lvl == 1 then
    return string.format( is..' or '..is, main, alt )
  elseif lvl == 2 then
    return string.format( is, main )
  elseif lvl == 3 then
    return string.format( is, alt )
  else
    return ''
  end
end

function returnLibStrings()
  local str = ''
  for _, v in ipairs( libs ) do
    str = str .. [[
require ']] .. v .. [['
]]
  end

  return str
end

local libsStr = not flags.libs and '' or returnLibStrings()

local keyLvl = flags.keys and 1 or flags.wasd and flags.arrows and 1 or flags.wasd and 2 or flags.arrows and 3 or 0
local keys = {
  use = flags.keys or flags.wasd or flags.arrows,

  strings = {
    up = keyString( keyLvl, 'w', 'up' ),
    down = keyString( keyLvl, 's', 'down' ),
    left = keyString( keyLvl, 'a', 'left' ),
    right = keyString( keyLvl, 'd', 'right' )
  }
}
local keyVars = not keys.use and '' or [[
local keyDown = {
  left = false,
  right = false,
  down = false,
  up = false
}
]]
local keypressed = not keys.use and '' or [[
if ]]..keys.strings.up..[[ then
    keyDown.up = true
  elseif ]]..keys.strings.left..[[ then
    keyDown.left = true
  elseif ]]..keys.strings.down..[[ then
    keyDown.down = true
  elseif ]]..keys.strings.right..[[ then
    keyDown.right = true
  end
]]
local keyreleased = not keys.use and '' or [[
if ]]..keys.strings.up..[[ then
    keyDown.up = false
  elseif ]]..keys.strings.left..[[ then
    keyDown.left = false
  elseif ]]..keys.strings.down..[[ then
    keyDown.down = false
  elseif ]]..keys.strings.right..[[ then
    keyDown.right = false
  end
]]
local keyupdate = not keys.use and '' or [[
if keyDown.up then
    -- Up movement here
  end

  if keyDown.down then
    -- Down movement here
  end

  if keyDown.left then
    -- Left movement here
  end

  if keyDown.right then
    -- Right movement here
  end
]]

mainFile:write( (not flags.libs and '' or [[
]]..libsStr..[[

]])..keyVars..[[

--  Main functions

function love.load( arg )
]]..(flags.physics == true and [[
  love.physics.setMeter( ]]..tostring( flags.meter )..[[ )
  world = love.physics.newWorld( ]]..tostring( flags.gravityX )..', '..tostring( flags.gravityY )..', true'..[[ )
end
]] or [[
end
]])..[[

function love.update( dt )
]]..(keyupdate ~= '' and [[
  ]]..keyupdate..[[
end
]] or [[
end
]])..[[

function love.draw()
end

--  Key and text input handling

function love.keypressed( key, isrepeat )
]]..(keypressed ~= '' and [[
  ]]..keypressed..[[
end
]] or [[
end
]])..[[

function love.keyreleased( key )
]]..(keyreleased ~= '' and [[
  ]]..keyreleased..[[
end
]] or [[
end
]])..[[

function love.textinput( text )
end

--  Mouse handling

function love.mousepressed( x, y, button )
end

function love.mousereleased( x, y, button )
end

--  Focus handling

function love.focus( f )
end

function love.mousefocus( f )
end

function love.visible( v )
end

--  Resize handling

-- function love.resize( w, h )
-- end

--  Main loop & ending func

-- function love.run()
-- end

-- function love.quit()
-- end

--  Error handling

-- function love.errhand( msg )
-- end

-- function love.threaderror( thread, errorstr )
-- end

function beginContact( a, b, coll )

end

function endContact( a, b, coll )
  
end

function preSolve( a, b, coll )

end

function postSolve( a, b, coll )
  
end
]] )

mainFile:flush()
mainFile:close()

os.execute( 'touch conf.lua' )

local confFile = io.open( 'conf.lua', 'w+' )
assert( io.type( confFile ) == 'file', 'File conf.lua was not opened successfully' )

confFile:write( [[
function love.conf(t)
  t.identity = nil          -- The name of the save directory (string)
  t.version = '0.9.0'         -- The LÖVE version this game was made for (string)
  t.console = false         -- Attach a console (boolean, Windows only)

  t.window.title = ']]..tostring( flags.title )..[['          -- The window title (string)
  t.window.icon = nil         -- Filepath to an image to use as the windows icon (string)
  t.window.width = ]]..tonumber( flags.width )..[[        -- The window width (number)
  t.window.height = ]]..tonumber( flags.height )..[[        -- The window height (number)
  t.window.borderless = false     -- Remove all border visuals from the window (boolean)
  t.window.resizable = false      -- Let the window be user-resizable (boolean)
  t.window.minwidth = ]]..tonumber( flags.width )..[[       -- Minimum window width if the window is resizable (number)
  t.window.minheight = ]]..tonumber( flags.height )..[[     -- Minimum window height if the window is resizable (number)
  t.window.fullscreen = false     -- Enable fullscreen (boolean)
  t.window.fullscreentype = 'normal'  -- Standard fullscreen or desktop fullscreen mode (string)
  t.window.vsync = true       -- Enable vertical sync (boolean)
  t.window.fsaa = 0         -- The number of samples to use with multi-sampled antialiasing (number)
  t.window.display = 1        -- Index of the monitor to show the window in (number)

  t.modules.audio = true        -- Enable the audio module (boolean)
  t.modules.event = true        -- Enable the event module (boolean)
  t.modules.graphics = true     -- Enable the graphics module (boolean)
  t.modules.image = true        -- Enable the image module (boolean)
  t.modules.joystick = true     -- Enable the joystick module (boolean)
  t.modules.keyboard = true     -- Enable the keyboard module (boolean)
  t.modules.math = true       -- Enable the math module (boolean)
  t.modules.mouse = true        -- Enable the mouse module (boolean)
  t.modules.physics = true      -- Enable the physics module (boolean)
  t.modules.sound = true        -- Enable the sound module (boolean)
  t.modules.system = true       -- Enable the system module (boolean)
  t.modules.timer = true        -- Enable the timer module (boolean)
  t.modules.window = true       -- Enable the window module (boolean)
end
]] )

confFile:flush()
confFile:close()

os.exit( true )

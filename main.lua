#!/usr/bin/env lua

local flags = {
	wasd = false,
	arrows = false,
	keys = false,

	title = '',
	width = 800,
	height = 600
}

local a = nil
local b = nil
local s = nil

for _,v in ipairs( arg ) do
	s = string.find( v, '=' )
	if s then
		a = string.sub( v, 1, s-1 )
		b = string.sub( v, s+1 )

		if flags[a] ~= nil then
			flags[a] = b
		end
	end
end

os.execute( 'touch main.lua' )
os.execute( 'touch conf.lua' )

local mainFile = io.open( 'main.lua', 'w+' )
assert( io.type( mainFile ) == 'file', 'File main.lua was not opened successfully' )

local hasKeys = flags.keys or flags.wasd or flags.arrows
local keyLvl = flags.keys and 1 or flags.wasd and flags.arrows and 1 or flags.wasd and 2 or flags.arrows and 3 or 0
local keyVars = not hasKeys and '' or [[
local keyDown = {
	left = false,
	right = false,
	down = false,
	up = false
}
]]
local keyIs = 'key == '
local keyStr = {
	w = keyIs.."'w'",
	up = keyIs.."'up'",
	s = keyIs.."'s'",
	down = keyIs.."'down'",
	a = keyIs.."'a'",
	left = keyIs.."'left'",
	d = keyIs.."'d'",
	right = keyIs.."'right'"
}
local upStr = keyLvl == 1 and keyStr.w..' or '..keyStr.up or keyLvl == 2 and keyStr.w or keyLvl == 3 and keyStr.up or ''
local downStr = keyLvl == 1 and keyStr.s..' or '..keyStr.down or keyLvl == 2 and keyStr.s or keyLvl == 3 and keyStr.down or ''
local leftStr = keyLvl == 1 and keyStr.a..' or '..keyStr.left or keyLvl == 2 and keyStr.a or keyLvl == 3 and keyStr.left or ''
local rightStr = keyLvl == 1 and keyStr.d..' or '..keyStr.right or keyLvl == 2 and keyStr.d or keyLvl == 3 and keyStr.right or ''
local keypressed = not hasKeys and '' or [[
if ]]..upStr..[[ then
		keyDown.up = true
	elseif ]]..leftStr..[[ then
		keyDown.left = true
	elseif ]]..downStr..[[ then
		keyDown.down = true
	elseif ]]..rightStr..[[ then
		keyDown.right = true
	end
]]
local keyreleased = not hasKeys and '' or [[
if ]]..upStr..[[ then
		keyDown.up = false
	elseif ]]..leftStr..[[ then
		keyDown.left = false
	elseif ]]..downStr..[[ then
		keyDown.down = false
	elseif ]]..rightStr..[[ then
		keyDown.right = false
	end
]]
local keyupdate = not hasKeys and '' or [[
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

mainFile:write( keyVars..[[

--	Main functions

function love.load( arg )
end

function love.update( dt )
	]]..keyupdate..[[
end

function love.draw()
end

--	Key and text input handling

function love.keypressed( key, isrepeat )
	]]..keypressed..[[
end

function love.keyreleased( key )
	]]..keyreleased..[[
end

function love.textinput( text )
end

--	Mouse handling

function love.mousepressed( x, y, button )
end

function love.mousereleased( x, y, button )
end

--	Focus handling

function love.focus( f )
end

function love.mousefocus( f )
end

function love.visible( v )
end

--	Resize handling

-- function love.resize( w, h )
-- end

--	Main loop & ending func

-- function love.run()
-- end

-- function love.quit()
-- end

--	Error handling

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

local confFile = io.open( 'conf.lua', 'w+' )
assert( io.type( confFile ) == 'file', 'File conf.lua was not opened successfully' )

confFile:write( [[
function love.conf(t)
	t.identity = nil					-- The name of the save directory (string)
	t.version = '0.9.0'					-- The LÖVE version this game was made for (string)
	t.console = false					-- Attach a console (boolean, Windows only)

	t.window.title = ']]..tostring( flags.title )..[['					-- The window title (string)
	t.window.icon = nil					-- Filepath to an image to use as the windows icon (string)
	t.window.width = ]]..tonumber( flags.width )..[[				-- The window width (number)
	t.window.height = ]]..tonumber( flags.height )..[[				-- The window height (number)
	t.window.borderless = false			-- Remove all border visuals from the window (boolean)
	t.window.resizable = false			-- Let the window be user-resizable (boolean)
	t.window.minwidth = ]]..tonumber( flags.width )..[[				-- Minimum window width if the window is resizable (number)
	t.window.minheight = ]]..tonumber( flags.height )..[[			-- Minimum window height if the window is resizable (number)
	t.window.fullscreen = false			-- Enable fullscreen (boolean)
	t.window.fullscreentype = 'normal'	-- Standard fullscreen or desktop fullscreen mode (string)
	t.window.vsync = true				-- Enable vertical sync (boolean)
	t.window.fsaa = 0					-- The number of samples to use with multi-sampled antialiasing (number)
	t.window.display = 1				-- Index of the monitor to show the window in (number)

	t.modules.audio = true				-- Enable the audio module (boolean)
	t.modules.event = true				-- Enable the event module (boolean)
	t.modules.graphics = true			-- Enable the graphics module (boolean)
	t.modules.image = true				-- Enable the image module (boolean)
	t.modules.joystick = true			-- Enable the joystick module (boolean)
	t.modules.keyboard = true			-- Enable the keyboard module (boolean)
	t.modules.math = true				-- Enable the math module (boolean)
	t.modules.mouse = true				-- Enable the mouse module (boolean)
	t.modules.physics = true			-- Enable the physics module (boolean)
	t.modules.sound = true				-- Enable the sound module (boolean)
	t.modules.system = true				-- Enable the system module (boolean)
	t.modules.timer = true				-- Enable the timer module (boolean)
	t.modules.window = true				-- Enable the window module (boolean)
end
]] )

confFile:flush()
confFile:close()

os.exit( true )

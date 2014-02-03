os.execute( 'touch main.lua' )
os.execute( 'touch conf.lua' )

local mainFile = io.open( 'main.lua', 'w+' )
assert( io.type( mainFile ) == 'file', 'File main.lua was not opened successfully' )

mainFile:write( [[
--	Main functions

function love.load()
end

function love.update()
end

function love.draw()
end

--	Key and text input handling

function love.keypressed()
end

function love.keyreleased()
end

function love.textinput()
end

--	Mouse handling

function love.mousepressed()
end

function love.mousereleased()
end

--	Focus handling

function love.focus()
end

function love.mousefocus()
end

function love.visible()
end

--	Resize handling

-- function love.resize()
-- end

--	Main loop & ending func

-- function love.run()
-- end

-- function love.quit()
-- end

--	Error handling

-- function love.errhand()
-- end

-- function love.threaderror()
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

	t.window.title = ''					-- The window title (string)
	t.window.icon = nil					-- Filepath to an image to use as the windows icon (string)
	t.window.width = 800				-- The window width (number)
	t.window.height = 600				-- The window height (number)
	t.window.borderless = false			-- Remove all border visuals from the window (boolean)
	t.window.resizable = false			-- Let the window be user-resizable (boolean)
	t.window.minwidth = 800				-- Minimum window width if the window is resizable (number)
	t.window.minheight = 600			-- Minimum window height if the window is resizable (number)
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

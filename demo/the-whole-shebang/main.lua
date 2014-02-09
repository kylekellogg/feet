require 'libs/jupiter'
require 'libs/middleclass'
require 'libs/jumper'
require 'libs/AnAL'
require 'libs/sick'
require 'libs/Love3D'
require 'libs/goo'
require 'libs/NoobHub'
require 'libs/adult'
require 'libs/cock'
require 'libs/Beetle'
require 'libs/moses'
require 'libs/hs2'
require 'libs/Tserial'
require 'libs/TEsound'
require 'libs/richtext'
require 'libs/LoveAStar'
require 'libs/rotLove'
require 'libs/AdvancedTileLoader'
require 'libs/quickie'
require 'libs/slam'
require 'libs/HardonCollider'
require 'libs/LOVEly-tiles'
require 'libs/cupid'
require 'libs/LUBE'
require 'libs/Swingers'
require 'libs/30log'
require 'libs/TLpath'
require 'libs/UaLove'
require 'libs/LoveFrames'
require 'libs/TLbind'
require 'libs/TLfres'
require 'libs/LoveToys'
require 'libs/RandomLua'
require 'libs/stateful'
require 'libs/hump'
require 'libs/Serial'
require 'libs/LoveUpdate'

local keyDown = {
  left = false,
  right = false,
  down = false,
  up = false
}

--  Main functions

function love.load( arg )
  love.physics.setMeter( 32 )
  world = love.physics.newWorld( 0, 0.01, true )
end

function love.update( dt )
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
end

function love.draw()
end

--  Key and text input handling

function love.keypressed( key, isrepeat )
  if key == 'w' or key == 'up' then
    keyDown.up = true
  elseif key == 'a' or key == 'left' then
    keyDown.left = true
  elseif key == 's' or key == 'down' then
    keyDown.down = true
  elseif key == 'd' or key == 'right' then
    keyDown.right = true
  end
end

function love.keyreleased( key )
  if key == 'w' or key == 'up' then
    keyDown.up = false
  elseif key == 'a' or key == 'left' then
    keyDown.left = false
  elseif key == 's' or key == 'down' then
    keyDown.down = false
  elseif key == 'd' or key == 'right' then
    keyDown.right = false
  end
end

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

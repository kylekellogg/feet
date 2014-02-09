
--  Main functions

function love.load( arg )
  love.physics.setMeter( 64 )
  world = love.physics.newWorld( 0, 64 * 9.81, true )
end

function love.update( dt )
end

function love.draw()
end

--  Key and text input handling

function love.keypressed( key, isrepeat )
end

function love.keyreleased( key )
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

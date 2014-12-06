function love.load()
  love.graphics.setNewFont(12)
	love.graphics.setColor(255,0,0)
	love.graphics.setBackgroundColor(255,255,255)
end
dtotal = 0
function love.update(dt)
  posX = 560
  posY = 100
  Text = dt
  dtotal = dtotal + dt
  if dtotal >= 0.016666667 then --Run physics at 60fps
    dtotal = dtotal - 0.016666667
    --Run world update function
  end
end
function love.draw()
	love.graphics.print(Text, posX , posY)
end
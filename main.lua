function love.conf(t)
  t.window.width = 1280
  t.window.height = 720
  t.window.title = "The Thing From Space ^ TM"        -- The window title (string)
  t.window.vsync = false
end
function love.load()
  love.graphics.setNewFont(12)
	love.graphics.setColor(255,0,0)
	love.graphics.setBackgroundColor(255,255,255)
end
function love.update(dt)
  posX = 560
  posY = 100
  Text = dt
end
function love.draw()
	love.graphics.print(Text, posX , posY)
end
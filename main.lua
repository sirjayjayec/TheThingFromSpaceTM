function love.load()
	love.graphics.setNewFont(12)
	love.graphics.setColor(255,0,0)
	love.graphics.setBackgroundColor(255,255,255)
end
function love.update(dt)
  posX = 560
  posY = 100
end
function love.draw()
	love.graphics.print("THIS IS SOME TEXT", posX , posY)
end
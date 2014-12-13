function love.load()
  love.graphics.setNewFont(12)
	love.graphics.setColor(255,0,0)
	love.graphics.setBackgroundColor(255,255,255)
  objHdlr = require('ObjHandler')
  objHdlr.fillObjArray()
end
dtotal = 0
Text = 0
x = 0
function love.update(dt)
  posX = 560
  posY = 100
  dtotal = dtotal + dt
  if dtotal >= 0.01667 then --Run physics at 60fps
    Text = tostring(dtotal)
  end
end
function love.draw()
	love.graphics.print(objHdlr.RtnObjLength()) --print the colshape of object 0
end
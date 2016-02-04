local ImgHandler = {}
local IH = ImgHandler


--10x10 tiles (each tile is 32x32)
function IH.loadTileset(pathToFile, amount)
  tilesetImg = love.graphics.newImage("images/tilesets/" .. pathToFile)
  tilesetImg:setFilter("nearest", "linear")
  images = {}
  y = 0
  while y < amount do
    x = 0
    while x < amount do
      x = x + 1
      img = love.graphics.newQuad(x * 32, y * 32, 32, 32, tilesetImg:getWidth(), tilesetImg:getHeight())
      table.insert(images, img)
    end
    y = y +1
  end
  return images
end

return ImgHandler
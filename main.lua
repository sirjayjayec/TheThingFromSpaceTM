function love.load()
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  love.graphics.setNewFont(12)
	love.graphics.setColor(255,255,255)
	love.graphics.setBackgroundColor(0,0,0)
  objHdlr = require('ObjHandler')
  bkgHdlr = require('BkgHandler')
  inpHdlr = require("InpHandler")
  objHdlr.fillObjArray()
  bkgHdlr.fillBkgArray()
  loadObjectImage()
  loadImages()
end
ObjImages = {}
Images = {}
Char = {}
dtotal = 0
Text = 0
x = 0
ScaleModifier = .5
XModifier = (love.graphics.getWidth()/2)
YModifier = (love.graphics.getHeight()/2)
ActiveObject = 0
totalFrames = 0
renderIntX = 0
renderIntY = 0
seconds = 0
FuncMode = "F1"
DebugInfo = ""
CharX = 500
CharY = 500

-- Variables for charecter renderer
CharFrameNo = 8 --number of frames in the animation
CharFrame = 0
CharAnimationInterval=5 --the lower this number the faster the animation will appear.
CharAnimationValue = 0
Char = {}

function love.update(dt)
  UpdateDebugInfo()
  posX = 560
  posY = 100
  dtotal = dtotal + dt
  
--Game runs using vSync but the frame rate is unlocked, game physics limited to 60Hz by being called from this loop
  if dtotal >= 0.01667 then 
    dtotal = 0
    totalFrames = totalFrames + 1
    CharAnimation()
    inpHdlr.InputHandler() --INPUTS in InpHandler.lua
    
  end
    Text = tostring(dtotal)
end
function UpdateDebugInfo()
  DebugInfo = ""
  DebugInfo = DebugInfo .. "Frames:" .. tostring(totalFrames) .. " | "
  DebugInfo = DebugInfo .. "Objects:" .. tostring(objHdlr.RtnObjLength()/10) .. " | "
  DebugInfo = DebugInfo .. "Scale:" .. tostring(ScaleModifier) .. " | "
  DebugInfo = DebugInfo .. "Mode:" .. FuncMode .. " | "
end
function loadImages()
  Images[0] = love.graphics.newImage("images/grass.png")
  Images[1] = love.graphics.newImage("images/pathN.png")
  Images[2] = love.graphics.newImage("images/pathNE.png")
  Images[3] = love.graphics.newImage("images/pathE.png")
  Images[4] = love.graphics.newImage("images/pathSE.png")
  Images[5] = love.graphics.newImage("images/pathS.png")
  Images[6] = love.graphics.newImage("images/pathSW.png")
  Images[7] = love.graphics.newImage("images/pathW.png")
  Images[8] = love.graphics.newImage("images/pathNW.png")
  Char[00] = love.graphics.newImage("images/Sara/north0.png")
  Char[01] = love.graphics.newImage("images/Sara/north1.png")
  Char[02] = love.graphics.newImage("images/Sara/north2.png")
  Char[03] = love.graphics.newImage("images/Sara/north3.png")
  Char[04] = love.graphics.newImage("images/Sara/north4.png")
  Char[05] = love.graphics.newImage("images/Sara/north5.png")
  Char[06] = love.graphics.newImage("images/Sara/north6.png")
  Char[07] = love.graphics.newImage("images/Sara/north7.png")
  Char[08] = love.graphics.newImage("images/Sara/north8.png")
  Char[10] = love.graphics.newImage("images/Sara/east0.png")
  Char[11] = love.graphics.newImage("images/Sara/east1.png")
  Char[12] = love.graphics.newImage("images/Sara/east2.png")
  Char[13] = love.graphics.newImage("images/Sara/east3.png")
  Char[14] = love.graphics.newImage("images/Sara/east4.png")
  Char[15] = love.graphics.newImage("images/Sara/east5.png")
  Char[16] = love.graphics.newImage("images/Sara/east6.png")
  Char[17] = love.graphics.newImage("images/Sara/east7.png")
  Char[18] = love.graphics.newImage("images/Sara/east8.png")
  Char[20] = love.graphics.newImage("images/Sara/south0.png")
  Char[21] = love.graphics.newImage("images/Sara/south1.png")
  Char[22] = love.graphics.newImage("images/Sara/south2.png")
  Char[23] = love.graphics.newImage("images/Sara/south3.png")
  Char[24] = love.graphics.newImage("images/Sara/south4.png")
  Char[25] = love.graphics.newImage("images/Sara/south5.png")
  Char[26] = love.graphics.newImage("images/Sara/south6.png")
  Char[27] = love.graphics.newImage("images/Sara/south7.png")
  Char[28] = love.graphics.newImage("images/Sara/south8.png")
  Char[30] = love.graphics.newImage("images/Sara/west0.png")
  Char[31] = love.graphics.newImage("images/Sara/west1.png")
  Char[32] = love.graphics.newImage("images/Sara/west2.png")
  Char[33] = love.graphics.newImage("images/Sara/west3.png")
  Char[34] = love.graphics.newImage("images/Sara/west4.png")
  Char[35] = love.graphics.newImage("images/Sara/west5.png")
  Char[36] = love.graphics.newImage("images/Sara/west6.png")
  Char[37] = love.graphics.newImage("images/Sara/west7.png")
  Char[38] = love.graphics.newImage("images/Sara/west8.png")
end
function love.draw()
  --this is where the different parts are called to be rendered, called in order to have items show above others.
  BkgRender()
  ObjRender()
  CharacterRender()
  love.graphics.print(DebugInfo,5,5)
end
function BkgRender()
  while renderIntX <= 31 do
    while renderIntY <= 31 do
      ActiveImage = tonumber(bkgHdlr.RtnBkgValues(renderIntX, renderIntY))
      -- in the following ActiveX/YCord value assignments the renderIntX/Y are backward, it works but should be refactored.
      ActiveXCord = (renderIntY*32+XModifier)*ScaleModifier
      ActiveYCord = (renderIntX*32+YModifier)*ScaleModifier
      ActiveColSize = 32*ScaleModifier
      if ActiveImage ~= nil then
        love.graphics.draw(Images[ActiveImage],ActiveXCord,ActiveYCord,0,ScaleModifier,ScaleModifier)
      else
        love.graphics.rectangle("line",ActiveXCord,ActiveYCord,ActiveColSize,ActiveColSize)
      end
      renderIntY = renderIntY + 1
    end
    renderIntX = renderIntX + 1
    renderIntY = 0
  end
  renderIntX = 0
end
function loadObjectImage()
  while x < (objHdlr.RtnObjLength()/10)-1 do
    love.graphics.print(objHdlr.LoadObjectImages(x) .. ".png", 10, 10)
    ObjImages[x] = love.graphics.newImage(objHdlr.LoadObjectImages(x) .. ".png" )
    x = x + 1
  end
end
function ObjRender()
  renderInt = 0
  while renderInt <= (objHdlr.RtnObjLength()/10)-1 do
    ActiveColShape = objHdlr.RtnObjValues(renderInt, "ColShape")
    ActiveSprite = ObjImages[renderInt]
    ActiveColSize = objHdlr.RtnObjValues(renderInt,"ColSize")*ScaleModifier
    ActiveXCord = (objHdlr.RtnObjValues(renderInt,"XCord")+XModifier)*ScaleModifier
    ActiveYCord = (objHdlr.RtnObjValues(renderInt,"YCord")+YModifier)*ScaleModifier
    if ActiveColShape == "circle" then
      love.graphics.circle("line",ActiveXCord,ActiveYCord,ActiveColSize)
    elseif ActiveColShape == "square" then
      love.graphics.rectangle("line",ActiveXCord,ActiveYCord,ActiveColSize,ActiveColSize)
    end
    --the -8*ScaleModifier is used to ofset the sprites currently this is just tempory and very janky fix this
    --currently getting the actual image from the array isn't working debuging boggling my mind will attempt again tommorow.
    love.graphics.draw(ObjImages[1],ActiveXCord-8*ScaleModifier,ActiveYCord-8*ScaleModifier,0,ScaleModifier,ScaleModifier)
    renderInt=renderInt+1
  end
  renderInt = 0
end
function CharacterRender()
  CharScreenX = 0
  CharScreenY = 0
  CharScreenX = (CharX+XModifier)*ScaleModifier
  CharScreenY = (CharY+YModifier)*ScaleModifier
  love.graphics.draw(Char[CharFrame],CharScreenX,CharScreenY,0,ScaleModifier,ScaleModifier)
end
function CharAnimation()
  CharAnimationValue = CharAnimationValue + 1
  if CharAnimationValue >= CharAnimationInterval then
    CharAnimationValue = 0
    if CharFrame == CharFrameNo then
      CharFrame = 0
    else
      CharFrame = CharFrame + 1
    end
  end
end
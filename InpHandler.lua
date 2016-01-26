local InpHandler = {}
local IH = InpHandler

main = require("main")

function IH.InputHandler()
  if(love.keyboard.isDown("f1")) then
    FuncMode = "F1"
  elseif(love.keyboard.isDown("f2"))then
    FuncMode = "F2"
  end
  if(FuncMode == "F1") then --editor mode
    if(love.keyboard.isDown("lshift")) then
      if(love.keyboard.isDown("w"))then
        YModifier = YModifier -10
      elseif(love.keyboard.isDown("a"))then
        XModifier = XModifier -10
      elseif(love.keyboard.isDown("s"))then
        YModifier = YModifier +10
      elseif(love.keyboard.isDown("d"))then
        XModifier = XModifier +10
      end
    else
      if(love.keyboard.isDown("w"))then
        YModifier = YModifier -1
      elseif(love.keyboard.isDown("a"))then
        XModifier = XModifier -1
      elseif(love.keyboard.isDown("s"))then
        YModifier = YModifier +1
      elseif(love.keyboard.isDown("d"))then
        XModifier = XModifier +1
      elseif(love.keyboard.isDown("kp+"))then
        ScaleModifier = ScaleModifier + 0.025
      elseif(love.keyboard.isDown("kp-"))then
        ScaleModifier = ScaleModifier - 0.025
      end
    end
    if(ScaleModifier < .5)then
      ScaleModifier = .5
    elseif(ScaleModifier > 2)then
      ScaleModifier = 2
    end
  elseif(FuncMode == "F2") then --Play mode
    if(love.keyboard.isDown("w"))then
      CharY = CharY -2.5
    end
    if(love.keyboard.isDown("a"))then
      CharX = CharX -2.5
    end
    if(love.keyboard.isDown("s"))then
      CharY = CharY +2.5
    end
    if(love.keyboard.isDown("d"))then
      CharX = CharX +2.5
    end 
  end
end
return InpHandler
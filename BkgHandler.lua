local BkgHandler = {}
local BH = BkgHandler
local BkgData = {}
local objInfoLength = 0
local fillerInt = 0
function BH.fillBkgArray()
  while fillerInt < 32 do
    for line in love.filesystem.lines("World/0.0/0.0." .. tostring(fillerInt) .. ".bkg") do
      table.insert(BkgData, line)
    end
    fillerInt = fillerInt + 1
  end
end
function BH.RtnBkgValues(File,Line)
  BkgDataLoc = File*32+Line+1
  return(BkgData[BkgDataLoc])
end
return BkgHandler
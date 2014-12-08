local ObjHandler = {}
local OH = ObjHandler
local objInfo = {}
function OH.fillObjArray()
  for line in love.filesystem.lines("World/0.0.txt") do
    table.insert(objInfo, line)
  end
end
function OH.rtn12()
  return 12
end
return ObjHandler
local ObjHandler = {}
local OH = ObjHandler
local objInfo = {}
function OH.fillObjArray()
  for line in love.filesystem.lines("World/0.0.txt") do
    table.insert(objInfo, line)
  end
end
function OH.RtnObjValues(ObjID,DataType)
  return objInfo[ObjID*10+DataTypetoLN(DataType)]    
end
function DataTypetoLN(DataType)
  if DataType == "ImageFile" then
    return 1
  elseif DataType == "XCord" then
    return 2
  elseif DataType == "YCord" then
    return 3
  elseif DataType == "Rotation" then
    return 4
  elseif DataType == "ColShape" then
    return 5
  elseif DataType == "ColSize" then
    return 6
  elseif DataType == "Scale" then
    return 7
  end
end
return ObjHandler
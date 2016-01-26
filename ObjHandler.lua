local ObjHandler = {}
local OH = ObjHandler
local objInfo = {}
local objInfoLength = 0
function OH.fillObjArray()
  for line in love.filesystem.lines("World/0.0/0.0.OBJS") do
    table.insert(objInfo, line)
    objInfoLength = objInfoLength + 1
  end
end
function OH.RtnObjValues(ObjID,DataType)
  if(ObjID == 0)then
    return objInfo[DataTypetoLN(DataType)]
  else
    return objInfo[(ObjID*10+DataTypetoLN(DataType))]
  end
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
  elseif DataType == "Frames" then
    return 8
  end
end
function OH.RtnObjLength()
  return objInfoLength
end
function OH.LoadObjectImages(x)
  ActiveObjectSprite = OH.RtnObjValues(x,"ImageFile")
  ActiveObjectFrames = OH.RtnObjValues(x,"Frames")
  return  ActiveObjectSprite
  --animation currently not implemented simply trying to get object sprite rendering working.
  --load images in to 2d array
end
return ObjHandler
--[[
  放下纽扣时的处理。
--]]
function drop_bird(args)

  -- 取得纽扣节点
  local bird = args['scope']
  
  -- 如果移动已经成功则不做任何处理


  -- 取得拖放的目标位置
  local locationX = bird:getPositionX()
  local locationY = bird:getPositionY()
  
  _DROPPED_POSSITION = 0
  
  for i = 1, #_BIRDS_POSITIONS do
    if math.abs(_BIRDS_POSITIONS[i].x - locationX) < _BIRD_WIDTH and math.abs(_BIRDS_POSITIONS[i].y - locationY) < _BIRD_HEIGHT then
      _DROPPED_POSSITION = i
    end
  end
  
  if _DROPPED_POSSITION == 0 then
    _DROPPED_POSSITION = _SELECTED_POSITION
  end
  
  _BIRDS[_SELECTED_INDEXES[_DROPPED_POSSITION]]:setPosition(_BIRDS_POSITIONS[_SELECTED_POSITION])
  bird:setPosition(_BIRDS_POSITIONS[_DROPPED_POSSITION])
  
  local tmp = _SELECTED_INDEXES[_DROPPED_POSSITION]
    _SELECTED_INDEXES[_DROPPED_POSSITION] = _SELECTED_INDEXES[_SELECTED_POSITION]
    _SELECTED_INDEXES[_SELECTED_POSITION] = tmp
  
  
  
 --SimpleAudioEngine:sharedEngine():playEffect(_DROP_AUDIO:getCString(), false)
  
  

end
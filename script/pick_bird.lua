--[[
  拾起纽扣时的处理。
--]]
function pick_bird(args)

  -- 取得纽扣节点
  local bird = args['scope']
  
  -- 如果移动已经成功则不做任何处理
 if bird:getOpacity() < 255 then
    return
  end
  
  SimpleAudioEngine:sharedEngine():playEffect( _SELECTED_AUDIO:getCString(), false)

  -- 取得拖放的目标位置
  local locationX = bird:getPositionX()
  local locationY = bird:getPositionY()
  
  for i = 1, #_BIRDS_POSITIONS do
    if math.abs(_BIRDS_POSITIONS[i].x - locationX) < _BIRD_WIDTH and math.abs(_BIRDS_POSITIONS[i].y - locationY) < _BIRD_HEIGHT then
      _SELECTED_POSITION = i
    end
  end
    
  -- 使选择的纽扣显示在所有节点的上方
  _ROOT:reorderChild(bird, _MAX_Z_ORDER)
  _MAX_Z_ORDER = _MAX_Z_ORDER + 1

end
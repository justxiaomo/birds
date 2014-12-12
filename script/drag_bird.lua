--[[
  拖拽卡片时的处理。
--]]
function drag_bird(args)

  -- 取得纽扣节点
  local bird = args['scope']
  
  -- 如果移动已经成功则不做任何处理
  if bird:getOpacity() < 255 then
    return
  end

  -- 取得事件对象
  local touchEvent = args['touchEvent']

  -- 移动纽扣
  local location = touchEvent:getLocation()
  location = _ROOT:convertToNodeSpace(location)
  bird:setPosition(location)

end
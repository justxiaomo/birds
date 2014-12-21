--[[
  放下纽扣时的处理。
--]]
local backf=function(_BIRD)
  _BIRD:setVisible(true)
end
function drop_bird(args)

  -- 取得纽扣节点
  local bird = args['scope']
  local bingo = args['bingo']:getCString()
  local bingo1 = args['bingo1']:getCString()
  
  
  -- 如果移动已经成功则不做任何处理
  if bird:getOpacity() < 255 then
    return
  end

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
  
  
  for i = 1, #_BIRDS_POSITIONS do
       if _SELECTED_INDEXES[i] ~= i then
           _IS_COMPLETED = false
           break
        else
         _IS_COMPLETED = true
    end
  end
 --SimpleAudioEngine:sharedEngine():playEffect(_DROP_AUDIO:getCString(), false)
  
  if _IS_COMPLETED == true then
    -- 停止播放背景音
    SimpleAudioEngine:sharedEngine():stopBackgroundMusic()
    SimpleAudioEngine:sharedEngine():playEffect(_COMPLETED_AUDIO:getCString(), false)
    fadeInNode(_BIRD, _BIRD_POSITION, 0)
   
    --_BIRD:runAction(CCScaleTo:create(1, 1, 1))
    SimpleAudioEngine:sharedEngine():playEffect(_BIRD_AUDIO:getCString(), false)
      -- 在这里加粒子生成器
    --
    local bingoSystem = CCParticleSystemQuad:create(bingo)
      local batheNode = CCParticleBatchNode:createWithTexture(bingoSystem:getTexture())
      batheNode:addChild(bingoSystem)  
       
       _BIRD:addChild(batheNode)

      local bingo1System = CCParticleSystemQuad:create(bingo1)
      local batheNode1 = CCParticleBatchNode:createWithTexture(bingo1System:getTexture())
      batheNode1:addChild(bingo1System)  
       
      _BIRD:addChild(batheNode1)
    --
    --
    
    fadeInNode( _MASK,  _MASK_POSITION, 4,200)
    fadeInNode( _AGIN,  _AGIN_POSITION, 4)
    fadeInNode( _RETURN,  _RETURN_POSITION, 4)
    
    
    
    for i = 1, #_BIRDS do
      local node = _BIRDS[i]  
      node:setOpacity(140)
    end
   
  end

end
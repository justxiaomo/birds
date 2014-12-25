_MAX_Z_ORDER = 1

-- 函数：隐藏节点
function fadeOutNode(node)
  node:setOpacity(255)
  node:runAction(CCSequence:createWithTwoActions(CCFadeOut:create(0.24), CCCallFunc:create(function()
    node:setVisible(false)
  end)))
end
-- 函数：显示节点
function fadeInNode(node, position, time, opacity)
  _ROOT:reorderChild(node, _MAX_Z_ORDER)
  _MAX_Z_ORDER = _MAX_Z_ORDER + 1
  node:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(time), CCCallFunc:create(function()
    node:setVisible(true)
    node:runAction(CCFadeIn:create(0.25))
   
    if position ~= nil then
      node:setPosition(position)
    end
  end)))
end
  
function restart_game(args)
    
    if _INITIALIZED == nil then

    -- 将泛型数组转换成
    function to_numeric_array(generic, is_node)
      if is_node == nil then
        is_node = true
      end
      local numeric = {}
      for key, item in pairs(generic) do
        if is_node then
          item:setAnchorPoint(ccp(0.5, 0.5))
        end
        numeric[tonumber(key)] = item
      end
      return numeric
    end
    _ROOT = args['scope'] 
    _BIRDS = to_numeric_array(args['birds'], true)
    _BG_IMG = args['bg']
    _ANSWER = args['answer']
    _ANS = args['ans']
    _STOP = args['stop']
    _BIRD = args['bird']
    _MASK = args['mask']
    _AGIN = args['agin']
    _RETURN = args['return']
    
   
    _BACKGROUND_AUDIO = args['background_music']
    _SELECTED_AUDIO = args['selected_effect']
    _COMPLETED_AUDIO = args['completed_effect'] 
    _BIRD_AUDIO = args['bird_effect']
    _ANSWER_AUDIO = args['answer_effect']
    
    _bingo = args['bingo']:getCString()
    _bingo1 = args['bingo1']:getCString()
      
    _BG_IMG:setAnchorPoint(ccp(0.5, 0.5))
     _BG_IMG_POSITION = ccp(960,540)
    _ANSWER:setAnchorPoint(ccp(0.5, 0.5))
    _ANSWER_POSITION = ccp(960,540)
    _ANS:setAnchorPoint(ccp(0.5, 0.5))
    _ANS_POSITION = ccp(1604,48)
    _STOP:setAnchorPoint(ccp(0.5, 0.5))
    _STOP_POSITION = ccp(1629,1038)
    
    _BIRD:setScaleX(0.5)
    _BIRD:setScaleY(0.5)
    _BIRD:setAnchorPoint(ccp(0.5, 0.5))
    _BIRD_POSITION = ccp(960,120)
    
    _MASK:setScaleX(2)
    _MASK:setScaleY(2)
    _MASK:setAnchorPoint(ccp(0.5, 0.5))
    _MASK_POSITION = ccp(960,540)
    
    
    _AGIN:setAnchorPoint(ccp(0.5, 0.5))
    _AGIN_POSITION = ccp(960,540)
    
    _RETURN:setAnchorPoint(ccp(0.5, 0.5))
    _RETURN_POSITION = ccp(960,420)
    
    _BIRD_WIDTH = 425 / 2
    _BIRD_HEIGHT = 305 / 2
    
    _BIRDS_POSITIONS = {
      ccp(536, 853),
      ccp(961, 853),
      ccp(1386, 853),
      ccp(536, 548),
      ccp(961, 548),
      ccp(1386, 548),
      ccp(536, 243),
      ccp(961, 243),
      ccp(1386, 243)
    }
  end
  for key, node in pairs(_BIRDS) do
       node:setVisible(false)
  end
  
    _ANSWER:setVisible(false)
    _BG_IMG:setVisible(false)
    _ANS:setVisible(false)
    _STOP:setVisible(false)
    _BIRD:setVisible(false)
    _MASK:setVisible(false)
    _AGIN:setVisible(false)
    _RETURN:setVisible(false)
  fadeInNode( _BG_IMG, _BG_IMG_POSITION, 0.25)
  fadeInNode( _ANS, _ANS_POSITION, 0.25)
  fadeInNode( _STOP,  _STOP_POSITION, 0.25)
  
  -- 初始化随机数（设置随机数种子）
  math.randomseed(os.clock())
  
  -- 设置新游戏选择的卡片的索引
  local all_indexes = {}
  for i = 1, #_BIRDS do
    table.insert(all_indexes, i)
  end
  
  _SELECTED_INDEXES = {}
  for i = 1, #_BIRDS_POSITIONS do
    local index = math.random(#all_indexes)
    local selected_number_index = all_indexes[index]
    local node = _BIRDS[selected_number_index]  
    fadeInNode(node, _BIRDS_POSITIONS[i], 0.25)
    table.insert(_SELECTED_INDEXES, selected_number_index)
    table.remove(all_indexes, index)
  end
  
  -- 隐藏蒙板
  if _INITIALIZED ~= nil then
    fadeOutNode(_MASK)
    _BIRD:setScaleX(0.5)
    _BIRD:setScaleY(0.5)
  end
  
  _IS_COMPLETED = false 
    
    
    --SimpleAudioEngine:sharedEngine():playEffect(_BACKGROUND_AUDIO:getCString(), false)
    SimpleAudioEngine:sharedEngine():playBackgroundMusic(_BACKGROUND_AUDIO:getCString(), true)
    
     --fadeInNode( _BIRD,  _BIRD_POSITION)
     --fadeInNode( _MASK,  _MASK_POSITION)
     --fadeInNode( _AGIN,  _AGIN_POSITION)
     --fadeInNode( _RETURN,  _RETURN_POSITION)
     fadeInNode(_ANSWER, _ANSWER_POSITION, 0.25)
     
   --answer:runAction(CCSequence:createWithTwoActions(delay_action,CCFadeOut:create(1)))
    --_ANSWER:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(1), 
   -- CCFadeOut:create(1)))
    --answer:setVisible(false)
    --answer:runAction(CCFadeOut:create(0.25))
    
    local delay_action = CCDelayTime:create(2)
    local pauseall= CCCallFunc:create(function() _ANSWER:setVisible(false) end)
    _ROOT:runAction(CCSequence:createWithTwoActions(delay_action , pauseall ))
    _INITIALIZED = true
end
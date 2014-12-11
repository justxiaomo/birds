_MAX_Z_ORDER = 1

-- 函数：隐藏节点
function fadeOutNode(node)
  node:setOpacity(255)
  node:runAction(CCSequence:createWithTwoActions(CCFadeOut:create(0.24), CCCallFunc:create(function()
    node:setVisible(false)
  end)))
end
-- 函数：显示节点
function fadeInNode(node, position, opacity)
  _ROOT:reorderChild(node, _MAX_Z_ORDER)
  _MAX_Z_ORDER = _MAX_Z_ORDER + 1
  node:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(0.25), CCCallFunc:create(function()
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
    _BACKGROUND_AUDIO = args['background_music']
      _SELECTED_AUDIO = args['selected_effect'] 
      
    _BG_IMG:setAnchorPoint(ccp(0.5, 0.5))
     _BG_IMG_POSITION = ccp(960,540)
    _ANSWER:setAnchorPoint(ccp(0.5, 0.5))
    _ANSWER_POSITION = ccp(960,540)
    _ANS:setAnchorPoint(ccp(0.5, 0.5))
    _ANS_POSITION = ccp(1604,48)
    _STOP:setAnchorPoint(ccp(0.5, 0.5))
    _STOP_POSITION = ccp(1629,1038)
    
    _BIRD_WIDTH = 425 / 2
    _BIRD_HEIGHT = 305 / 2
    
    _BIRDS_POSITIONS = {
      ccp(536, 243),
      ccp(961, 243),
      ccp(1386, 243),
      ccp(536, 548),
      ccp(961, 548),
      ccp(1386, 548),
      ccp(536, 853),
      ccp(961, 853),
      ccp(1386, 853)
    }
  end
  for key, node in pairs(_BIRDS) do
       node:setVisible(false)
  end
  
    _ANSWER:setVisible(false)
    _BG_IMG:setVisible(false)
    _ANS:setVisible(false)
    _STOP:setVisible(false)
  fadeInNode( _BG_IMG, _BG_IMG_POSITION)
  fadeInNode( _ANS, _ANS_POSITION)
  fadeInNode( _STOP,  _STOP_POSITION)
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
    fadeInNode(node, _BIRDS_POSITIONS[i])
    table.insert(_SELECTED_INDEXES, selected_number_index)
    table.remove(all_indexes, index)
  end
    
   
    
    
    SimpleAudioEngine:sharedEngine():playEffect(_BACKGROUND_AUDIO:getCString(), false)
    
     fadeInNode(_ANSWER, _ANSWER_POSITION)
   --answer:runAction(CCSequence:createWithTwoActions(delay_action,CCFadeOut:create(1)))
    _ANSWER:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(1), 
    CCFadeOut:create(1)))
    --answer:setVisible(false)
    --answer:runAction(CCFadeOut:create(0.25))
    _INITIALIZED = true
end
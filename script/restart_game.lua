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
    if opacity ~= nil then
      node:setOpacity(opacity)
    end
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
    _answer = args['answer']
    _BIRDS_POSITIONS = {
      ccp(536, 243),
      ccp(960, 243),
      ccp(1348, 243),
      ccp(536, 548),
      ccp(960, 548),
      ccp(1348, 548),
      ccp(536, 853),
      ccp(960, 853),
      ccp(1348, 853)
    }
    end
  for key, node in pairs(_BIRDS) do
       node:setVisible(false)
  end
  
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
    
   
    
    
    
    
    
   --answer:runAction(CCSequence:createWithTwoActions(delay_action,CCFadeOut:create(1)))
    _answer:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(1), 
    CCFadeOut:create(1)))
    --answer:setVisible(false)
    --answer:runAction(CCFadeOut:create(0.25))
    _INITIALIZED = true
end
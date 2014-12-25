function answer_game(args)
  
  -- 如果移动已经成功则不做任何处理

 
  SimpleAudioEngine:sharedEngine():playEffect(_ANSWER_AUDIO:getCString(), false)
  local node = args['scope']
  fadeInNode(_ANSWER,_ANSWER_POSITION,1)
  local delay_action = CCDelayTime:create(3)
  local pauseall= CCCallFunc:create(function() _ANSWER:setVisible(false) end)
  node:runAction(CCSequence:createWithTwoActions(delay_action , pauseall )) 
  
end
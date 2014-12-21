function answer_game(args)
  
  -- 如果移动已经成功则不做任何处理

 
  SimpleAudioEngine:sharedEngine():playEffect(_ANSWER_AUDIO:getCString(), false)
    
  if _ANSWER_GAME == nil then
    _ANSWER:setVisible(false)
    fadeInNode(_ANSWER, _ANSWER_POSITION, 0.25) 
    


    
    _ANSWER_GAME = true
  
  else
    _ANSWER:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(1), 
    CCFadeOut:create(1)))
    
    _ANSWER:setOpacity(255)   
    
    _ANSWER_GAME = nil

  end
end
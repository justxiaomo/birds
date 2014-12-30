
function restart_game(args)
<<<<<<< HEAD
=======
    
    
    local delay_action = CCDelayTime:create(2)
    local answer = args['answer']
    answer:runAction(CCSequence:createWithTwoActions(delay_action,CCFadeOut:create(1)))
>>>>>>> origin/master
     
      args['scope']:setVisible(false)
      
end
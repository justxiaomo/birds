_MAX_Z_ORDER = 1
function restart_game(args)
     _ROOT = args['scope']
     local bs_answer = args['b_answer']
     local dd=bs_answer:visible(true)
     _ROOT:runAction(dd)
     
end
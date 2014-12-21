function gotoPage(args)
  local scope = args["scope"]
  local scope1 = args["1"]
  




  if scope1:isVisible() then
    LuaController:sharedLuaController():gotoPage(1,1)
  
  end
end

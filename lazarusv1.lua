function onPath()
  local PATH = 'netherrack'
  success, block = turtle.inspectDown()
  if success then  
    if (block.name == 'minecraft:'..PATH) then
      return true
    else
      return false
    end
  else
    return false
  end
end

function checkLeft()
  turtle.turnLeft()
  turtle.forward()
  if onPath() == false then
    turtle.back()
    turtle.turnRight()
    return false
  end
  return true
end

function checkRight()
  turtle.turnRight()
  turtle.forward()
  if onPath() == false then
    turtle.back()
    turtle.turnLeft()
    return false
  end
  return true
end

function followPath()
  print('Lazarus Started')  
  while not turtle.detect() do  
    print('Forward!')
    while onPath() do
      turtle.forward()
    end
    print('Out of Path')
    turtle.back()
    if not checkLeft() then
      print('Nothing on the left')
      if not checkRight() then
        print('Nothing on the right')
        break
      end
    end  
  end
end

followPath()
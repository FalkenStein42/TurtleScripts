rednet.open('right')

function broadcast(message)
  print('> ',message)
  rednet.broadcast(message)
end

function checkFuel()
  local result, status = turtle.refuel()
  broadcast(status)  
  return result
end

function findHeight()
  broadcast('Caculating Height')
  local surface = 0
  while turtle.detectDown() == false do
    print('Down')
    turtle.down()
    surface = surface+1
    print(surface)  
  end

  local i = surface

  while i>0 do
    turtle.up()
    i = i-1
  end

  broadcast('Objective is '..surface..' blocks deep')
  return surface
end

function statusPercentage(max,min,current)  
  return (100-(current/math.abs(max-min))*100)    
end

function startQuarry()
  turtle.back()
  turtle.select(16)
  turtle.placeUp()
  turtle.forward()
end        
          
function checkQuarryStatus()
  broadcast('Quarry Helper Service Started')
  
  broadcast('Checking Fuel')
  if checkFuel() == false then
    rednet.broadcast('Turtle out of fuel')
    return false
  end
  
  local currentHeight = findHeight()
  local minHeight = 0
  local maxHeight = currentHeight
  
  broadcast('Starting Quarry...')
  startQuarry()
  broadcast('0%')
  
  while not turtle.detectDown() do
    if not turtle.detect() then
      turtle.down()
      currentHeight = currentHeight-1
      broadcast(statusPercentage(minHeight,maxHeight,currentHeight))    
    end
  end
  broadcast('DONE!')
end  
                         
checkQuarryStatus()
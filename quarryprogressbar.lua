rednet.open('right')

function rednetRecieve()
  while true do
   local id, message = rednet.receive()
   print('> ',message)
  end
end

function progressBar()

  

end
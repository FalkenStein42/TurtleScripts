rednet.open('right')

while true do
 local id, message = rednet.receive()
 print('> ',message)
end
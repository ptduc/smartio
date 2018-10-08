require 'socket'
require 'byebug'

s = TCPSocket.new 'localhost', 3003
mes = '{"ID":"10000006","Action":5,"Relay_1":{"mode":"manual","status":"on"},"Relay_2":{"mode":"manual","status":"on"},"Relay_3":{"mode":"manual","status":"off"},"Relay_4":{"mode":"manual","status":"off"}}'
s.puts mes
while line = s.gets # Read lines from socket
  puts line         # and print them
end
require 'socket'
require 'byebug'

s = TCPSocket.new 'localhost', 3003
mes = '{"ID":"10000000","Action":"0", "Message": {"ID": "10000002","Relay_1":{"mode":"0","status":"on"},"Relay_2":{"mode":"0","status":"on"},"Relay_3":{"mode":"0","status":"off"},"Relay_4":{"mode":"0","status":"off"}}}'
s.puts mes
while line = s.gets # Read lines from socket
  puts line         # and print them
end
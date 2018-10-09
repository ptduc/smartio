require 'socket'
require 'byebug'

s = TCPSocket.new 'localhost', 3003
mes = '{"ID":"10000000","Action":5,"Relay_1":{"mode":"0","status":"off"},"Relay_2":{"mode":"0","status":"off"},"Relay_3":{"mode":"0","status":"off"},"Relay_4":{"mode":"0","status":"off"}}'
s.puts mes

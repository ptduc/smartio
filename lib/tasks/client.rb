require 'socket'
require 'byebug'

# s = TCPSocket.new 'kynguyenxanh.org', 3003
s = TCPSocket.new 'localhost', 3003
mes = '{
  "ID": "10000004",
  "Action": 5,
  "Relay_1":  {
    "mode": 0,
    "status": 1
  },
  "Relay_2":  {
    "mode": 1,
    "status": 0
  },
  "Relay_3":  {
    "mode": 2,
    "status": 1
  },
  "Relay_4":  {
    "mode": 3,
    "status": 0
  }
}'
s.puts mes

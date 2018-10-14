require 'socket'
require 'byebug'

s = TCPSocket.new 'kynguyenxanh.net', 3003
mes = '{
  "ID": "10000002",
  "Action": 5,
  "Relay_1":  {
    "mode": 0,
    "status": 0
  },
  "Relay_2":  {
    "mode": 0,
    "status": 0
  },
  "Relay_3":  {
    "mode": 0,
    "status": 0
  },
  "Relay_4":  {
    "mode": 0,
    "status": 0
  }
}'
s.puts mes

require 'socket'
require 'json'
require 'pg'
require 'byebug'
server = TCPServer.new 3003

abc = {}
n = 1
DB_INFO='postgres://smartio:smartio@kynguyenxanh.net:5432/smartio_development'
conn = PG::Connection.new(DB_INFO)
res = conn.exec_params("INSERT INTO devices(\"code\", \"unit_id\", \"is_active\", \"created_at\", \"updated_at\") VALUES ('00001', 1, '1','#{Time.now}','#{Time.now}')")
puts res
loop do
  Thread.start(server.accept) do |client|
    abc[n] = client
    client.puts client.peeraddr[1]
    mes = ''
    while line = clients.gets # Read lines from socket
      mes << line        # and print them
    end
    open('/home/deploy/tcp/history.txt', 'a') do |f|
      f.puts "#{Time.now} - Message: #{client.gets}"
      f.puts mes
    end
    n = n + 1
  end
end

require 'socket'
require 'json'
require 'pg'

server = TCPServer.new 3003

abc = {}
n = 1
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

def 
  begin
    adapter: postgresql
    encoding: unicode
    host: kynguyenxanh.net
    username: smartio
    password: smartio
    con = PG.connect(host: host, dbname: dbname, user: user, password: passwd, port: 5432)

    user = con.user
    db_name = con.db
    pswd = con.pass
    
    puts "User: #{user}"
    puts "Database name: #{db_name}"
    puts "Password: #{pswd}" 
    
rescue PG::Error => e
    puts e.message  
end
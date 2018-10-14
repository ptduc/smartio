require 'socket'
require 'json'
class ClientRequest < ApplicationController
  def initialize(host = localhost, port)
    @client_request = TCPSocket.new host, port
  end

  def run message
    @client_request.puts message
    result = @client_request.gets
    @client_request.close
    result
  end
end

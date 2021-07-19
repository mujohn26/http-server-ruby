require 'socket'
require_relative './response'
require_relative './detail_route'
require_relative './route'
require_relative './request_parser'
require_relative './request.rb'
require 'ostruct'
require 'http/parser'

class Server
  def initialize(port)
    @port = port
    @routes = []
  end

  def add_route(method, path, handler)
    data_object = {
      path: path,
      handler: handler,
      method: method
    }
    @routes.push(data_object)
  end

  def start
  server = TCPServer.new @port

  print("Server running on #{@port}")
  loop do
    socket = server.accept
    socket.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1)
    request = Request.new(socket)
    request.handle

    route = Route.new
    handler_instance = route.get_handler(@routes, request)
    message = handler_instance.create_response(request)
    response = Response.new(socket)
    response.print_response(message)
    socket.close
  end

  end
end

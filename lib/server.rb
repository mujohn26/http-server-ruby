require 'socket'
require_relative './response'
require_relative './detail_route'
require_relative './route'
require_relative './parse_string'
require_relative './request_parser'
require 'ostruct'

# server class
class Server
  def initialize(port)
    @port = port
    @routes = []
  end

  def add_route(_method, path, handler)
    data_object = {
      path: path,
      handler: handler
    }
    @routes.push(data_object)
  end

  def start
    server = TCPServer.new @port
    loop do
      client = server.accept
      request_parser = RequestParser.new
      while (line = client.gets) && !line.chomp.empty?
        request_parser.add_line line.chomp
      end
      request = request_parser.generate_request
      route = Route.new
      handler_instance = route.get_handler(@routes, request)
      message = handler_instance.create_response(request)
      response = Response.new(client)
      response.print_response(message)
      client.close
    end
  end
end

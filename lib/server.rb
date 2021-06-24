require 'socket'
require_relative './response'
require_relative './detail_route'
require_relative './request'
require_relative './parse_string'
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
    client = server.accept
    request = []
    while (line = client.gets) && !line.chomp.empty?
      request << line.chomp
    end
    _http_method, request_uri, _protocol = request[0].split(' ')
    uri_parser = UriParser.new
    parsed_object = OpenStruct.new(uri_parser.request_uri_parser(request_uri))
    request = Request.new(client)
    request.make(@routes, parsed_object.path, parsed_object.query_string)
    client.close
  end
end

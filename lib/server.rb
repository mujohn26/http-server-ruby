require 'socket'
require_relative './response'
require_relative './detail_route'
require_relative './request'
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
    server1 = TCPServer.new @port
    loop do
      client = server1.accept
      request = []
      while (line = client.gets) && !line.chomp.empty?
        request << line.chomp
      end
      _http_method, path, _protocol = request[0].split(' ')
      if path.include?('&')
        detail = DetailRoute.new
        deatail_object = OpenStruct.new(detail.name_occupation_getter(path))
        response = Response.new(detail.create_response(deatail_object.name, deatail_object.occupation),client)
        response.print_response
      else
        request = Request.new(client)
        request.make(@routes, path)
      end
      client.close
    end
  end
end

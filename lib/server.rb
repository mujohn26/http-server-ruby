require 'socket'
require_relative './response.rb'
require 'ostruct'


class Server
  def initialize(port)
    @port = port
    @routes=[]
  end

  def add_route(method, path, handler)
    data_object ={
      :path=> path,
      :handler=> handler
    }
    @routes.push(data)
  end


  def start
   server1 = TCPServer.new @port
   loop do
   client = server1.accept
   request =[]
   while(line = client.gets) && (line.chomp.length>0) do
   request<<line.chomp
   end
   http_method, path,protocol = request[0].split(' ') 
   request = @routes.select {|v| v[:path] == path}
   handler_object = OpenStruct.new(request[0])
   handler_instance = handler_object.handler.new
   response = Response.new
   response.print_response(handler_instance.create_response,client)
   client.close
  
end
    # start the client and save a ref to it
    # when a connection comes in figure out what needs to handle that request
    # check the path
    # check if any route matches the request - and call the handler for that route
    # handler will create the response and send it back
    # close the connection
  end
end



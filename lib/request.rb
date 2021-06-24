require_relative './response'
require 'ostruct'
# request class
class Request
  def initialize(client)
    @client = client
  end
  
  def make(routes, path, query_strings)
    request = routes.select { |v| v[:path] == path }
    handler_instance = OpenStruct.new(request[0]).handler
    response = Response.new(@client)
    response.print_response(handler_instance.create_response(query_strings))
  end
end

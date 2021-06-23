require_relative './response'
require 'ostruct'
# request class
class Request
  def initialize(client)
    @client = client
  end

  def make(routes, path)
    request = routes.select { |v| v[:path] == path }
    handler_instance = OpenStruct.new(request[0]).handler
    response = Response.new(handler_instance.create_response, @client)
    response.print_response
  end
end

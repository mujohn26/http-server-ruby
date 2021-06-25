require_relative './response'
require_relative './not_found'
require 'ostruct'
# request class
class Request
  def initialize(client)
    @client = client
  end

  def make(routes, path, query_strings)
    request = routes.select { |v| v[:path] == "/#{path.split('/')[1]}" }
    message = ''
    if request.empty?
      not_found = NotFound.new
      message = not_found.create_response(query_strings, path)
    else
      handler_instance = OpenStruct.new(request[0]).handler
      message = handler_instance.create_response(query_strings, path)
    end

    response = Response.new(@client)
    response.print_response(message)
  end
end

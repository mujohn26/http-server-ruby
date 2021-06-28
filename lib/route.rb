require_relative './response'
require_relative './not_found'
require 'ostruct'
# request class
class Route
  def get_handler(routes, request)
    request = routes.select { |v| v[:path] == "/#{request[:path].split('/')[1]}" }
    if request.empty?
      NotFound.new
    else
      OpenStruct.new(request[0]).handler
    end
  end
end

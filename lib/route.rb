require_relative './not_found'
# request class
class Route
  def initialize
    @not_found = {
      handler: NotFound.new('/Users/john/Documents/kata/http-server-ruby/public/not-found.html')
    }
  end

  def get_handler(routes, request)
    route = routes.select do |v|
      v[:path] == "/#{request.request_path.split('/')[1]}" and v[:method] == request.method
    end
    request_route = route.empty? ? @not_found : route.first
    request_route[:handler]
  end
end

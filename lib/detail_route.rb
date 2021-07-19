require 'ostruct'

class DetailRoute
  def create_response(request)
    params_data = request.params
    {
      status: 'HTTP/1.1 200 OK',
      type: 'text/html',
      message: "<html><title>detail</title><body><h1>Hello #{params_data['name']}, the #{params_data['occupation']}</h1></body></html>"
    }
  end
end

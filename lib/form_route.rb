require_relative './request_parser'

class FormRoute
  def create_response(request)
     params = request.params

    {
      status: 'HTTP/1.1 200 OK',
      type: 'text/html',
      message: "<html><title>detail</title><body><h1>Hello #{params['name']}, the #{params['occupation']}</h1></body></html>"
    }
  end
end

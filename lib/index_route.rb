#index route class
class IndexRoute
  def create_response(_request)
    {
      status: 'HTTP/1.1 200 OK',
      type: 'text/html',
      message: '<html><title>index</title><body><h1>homepage</h1></body></html>'
    }
  end
end

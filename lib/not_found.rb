# time route class
class NotFound
  def create_response(_query_string,_path)
    {
      status: 'HTTP/1.1 404 OK',
      type: 'text/html',
      message: "
      <html>
      <head>
      <title>time</title>
      </head>
      <body>
      <h1>
      Page not found
      </h1>
      </body>
      </html>"
    }
  end
end

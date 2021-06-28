require 'mime-types'
# directory route class
class DirectoryRoute
  def initialize(path)
    @path = path
  end

  def create_response(_request)
    response = ''
    Dir.foreach(@path) do |file|
      response << "<li><a href='../public/#{file}'>#{file}</a></li>"
    end

    {
      status: 'HTTP/1.1 200 OK',
      type: 'text/html',
      message: <<-EOF
        <html>
          <head>
          <title>index</title>
          </head>
          <body>
            <ul>
              <h4>#{response}</h4>
            </ul>
          </body>
        </html>
EOF
    }
  end
end

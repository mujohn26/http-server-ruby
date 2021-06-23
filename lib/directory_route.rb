require 'mime-types'
# directory route class
class DirectoryRoute
  def initialize(path)
    @path = path
  end

  def create_response
    response = ''
    Dir.foreach(@path) do |file|
      response << "#{file}\n"
    end
    {
      status: 'HTTP/1.1 200 OK',
      type: 'text/html',
      message: "<html><title>index</title><body><h4>#{response}</h4></body></html>"
    }
  end
end

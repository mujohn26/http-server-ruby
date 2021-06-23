require 'mime-types'
# image route class
class ImageRoute
  def initialize(path)
    @path = path
    @mime_type = MIME::Types.type_for(path)[0]
  end

  def create_response
    file = File.binread @path
    {
      status: 'HTTP/1.1 200 OK',
      type: @mime_type,
      message: file
    }
  end
end

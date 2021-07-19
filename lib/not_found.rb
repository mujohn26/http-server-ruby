# time route class
class NotFound
  def initialize(path)
    @path = path
  end

  def create_response(_request)
    mime_type = MIME::Types.type_for(@path)[0]
    file = File.binread @path
    {
      status: 'HTTP/1.1 404',
      type: mime_type,
      message: file
    }
  end
end

class FileViewerRoute
  def initialize(path)
    @path = path
  end

  def create_response(request)
    mime_type = MIME::Types.type_for("#{@path}#{request[:path].split('/')[2]}")[0]
    file = File.binread "#{@path}#{request[:path].split('/')[2]}"
    {
      status: 'HTTP/1.1 200 OK',
      type: mime_type,
      message: file
    }
  end
end

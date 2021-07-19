require_relative './not_found'
class FileViewerRoute
  def initialize(path)
    @path = path
  end

  def create_response(request)
    response = []
    Dir.foreach(@path) do |file|
      response.push("/public/#{file}")
    end
    extention = File.extname(request.request_path).split('.')[1]
    mime_type = get_file_mime_type(extention)

    if response.include?(request.request_path)
      file = File.binread "#{@path}#{request.request_path.split('/')[2]}"
      {
        status: 'HTTP/1.1 200 OK',
        type: mime_type,
        message: file
      }
    else
      not_found = NotFound.new('/Users/john/Documents/kata/http-server-ruby/public/not-found.html')
      not_found.create_response(request)
    end
  end


  def get_file_mime_type(extention)
    extentions = {
      'html' => 'text/html',
      'css' => 'text/css',
      'jpeg' => 'image/jpeg',
      'png' => 'image/png',
      'mp4' => 'audio/mp4',
      'mp3' => 'audio/mpeg'
    }
    extentions[extention]
  end
end

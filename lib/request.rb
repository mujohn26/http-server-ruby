require_relative './request_parser'
class Request
  attr_reader :method, :request_path, :body, :params

  def initialize(socket)
    @socket = socket
    @headers = {}
  end


  def handle
    handle_request_line
    handle_headers
    handle_body if request_with_body
  end

  def handle_request_line
    request_parser= RequestParser.new
    request_line = @socket.gets
    request_line_array = request_line.split
    @method = request_line_array[0]
    @request_path = request_line_array[1].split('?')[0]
    @params = request_parser.split_params(request_line_array[1].split('?')[1] || '')
  end

  def handle_headers
    while (line = @socket.gets)
      break if line == "\r\n"

      if line.include?('HOST')
        @headers['HOST'] = line.gsub('Host:', '').strip.chomp
      else
        key = line.split(':').first.tr('-', '_').upcase
        value = line.split(':').last.strip.chomp
        @headers[key] = value
      end

    end
  end

  def handle_body
    @body = StringIO.new('')
    @body = StringIO.new(@socket.readpartial(@headers['CONTENT_LENGTH'].to_i))
    form_data = ''
    @body.each do |chunk|
    form_data << chunk
    end
    request_parser= RequestParser.new
    @params = request_parser.split_params(form_data)
  end

  def request_with_body
    (@method == 'POST' || @method == 'PUT') && @headers && @headers['CONTENT_LENGTH']
  end
end

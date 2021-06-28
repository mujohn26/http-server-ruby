require_relative './parse_string'
class RequestParser
  def initialize
    @line = []
  end

  def add_line(chomp)
    @line.push(chomp)
  end

  def generate_request
    _http_method, request_uri, _protocol = @line[0].split(' ')
    uri_parser = UriParser.new
    parsed_object = uri_parser.request_uri_parser(request_uri)
    {
      path: parsed_object[:path],
      query_string: parsed_object[:query_string]
    }
  end
end

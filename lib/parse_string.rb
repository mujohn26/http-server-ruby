require 'addressable/uri'

class UriParser
  def request_uri_parser(uri_string)
    uri = Addressable::URI.parse(uri_string)
    {
      path: uri.path,
      query_string: uri.query_values
    }
  end
end

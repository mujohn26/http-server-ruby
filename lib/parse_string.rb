require_relative './request_uri_split'

# uri parser class
class UriParser
  def request_uri_parser(uri_string)
    request_uri_split = RequestUriSplit.new(uri_string)
    {
      path: request_uri_split.uri[:path],
      query_string: request_uri_split.uri[:query_values]
    }
  end
end

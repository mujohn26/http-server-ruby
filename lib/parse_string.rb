require_relative './addressable'
require 'ostruct'

# uri parser class
class UriParser
  def request_uri_parser(uri_string)
    addressable = Addressable.new
    uri = OpenStruct.new(addressable.uri(uri_string))

    {
      path: uri.path,
      query_string: uri.query_values
    }
  end
end

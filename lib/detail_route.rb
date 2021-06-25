require 'ostruct'

class DetailRoute
  def create_response(query_string, _path)
    query_string_data= OpenStruct.new(query_string)
    {
      status: 'HTTP/1.1 200 OK',
      type: 'text/html',
      message: "<html><title>detail</title><body><h1>Hello #{query_string_data.name}, the #{query_string_data.occupation}</h1></body></html>"
    }
  end

end

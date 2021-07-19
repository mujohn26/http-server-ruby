require 'webrick'
require 'net/http'
RESPONSES = []

class RedirectRoute
  def fetch(uri_str, limit = 10)
    # You should choose a better exception.
    raise ArgumentError, 'too many HTTP redirects' if limit == 0

    response = Net::HTTP.get_response(URI(uri_str))
    RESPONSES << response
    case response
    when Net::HTTPSuccess
      response
    when Net::HTTPRedirection
      location = response['location']
      warn "redirected to #{location}"
      fetch(location, limit - 1)
    else
      response.value
    end
  end

  def create_response(_request, _client)
      print fetch('http://www.google.com')
      puts RESPONSES.join("\n")

 
  end
end

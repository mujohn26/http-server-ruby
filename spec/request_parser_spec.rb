require 'rubygems'
require 'rspec'
require_relative '../lib/request_parser'

describe RequestParser do
  it 'Returns parsed uri object' do
    request_parser = RequestParser.new
    request_parser.add_line('GET /hello?name=john&occupation=engineer HTTP')
    return_data = {
      path: '/hello',
      query_string: {
        'name' => 'john',
        'occupation' => 'engineer'
      }
    }
    expect(request_parser.generate_request).to eq(return_data)
  end
end

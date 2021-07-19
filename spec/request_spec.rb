require 'rubygems'
require 'rspec'
require_relative '../lib/request'

class MockSocket
  def initialize(request_type)
    @request_type = request_type
  end

  def gets
    if @request_type == 'line'
      ' POST /hello?name=john&occupation=engineer HTTP1.1 '
    else
      # ["Host: localhost","Connection: keep-alive","Cache-Control: max-age=0",'sec-ch-ua: " Not;A Brand";v="99", "Google Chrome";v="91", "Chromium";v="91"',"sec-ch-ua-mobile: ?0","Upgrade-Insecure-Requests: 1","User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36","Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9","Sec-Fetch-Site: none","Sec-Fetch-Mode: navigate","Sec-Fetch-User: ?1","Sec-Fetch-Dest: document","Accept-Encoding: gzip, deflate, br","Accept-Language: en-US,en;q=0.9","\r\n"]
    end
  end

  def readpartial(data)
  end
end

describe Request do
  it 'Sets request lines' do
    socket = MockSocket.new('line')
    request = Request.new(socket)
    request.handle_request_line
    expect(request.request_method).to eq('POST')
    expect(request.request_path).to eq('/hello')
    expect(request.params).to eq('name=john&occupation=engineer')
  end

  it 'Sets request headers' do
    socket = MockSocket.new(2)
    request = Request.new(socket)
   request.handle_headers
  end

  it 'Sets request body' do
    socket = MockSocket.new(2)
    request = Request.new(socket)
    request.headers("text/html")
    request.handle_body
  end
end

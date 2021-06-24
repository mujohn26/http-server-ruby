require 'rubygems'
require 'rspec'
require_relative '../lib/response'

class MockClient
  attr_reader :data

  def initialize
    @data = []
  end

  def puts(data)
    @data.push(data)
  end
end

path_png = '/Users/john/Documents/kata/http-server-ruby/public/cat.png'
client = MockClient.new
file = File.binread path_png
message = {
  status: 'HTTP/1.1 200 OK',
  type: 'image/jpeg',
  message: file
}
response = Response.new(client)
response.print_response message

describe Response do
  it 'returns nil from create_response' do
    expect(response.print_response(message)).to eq(nil)
  end

  it 'writes the response line to client' do
    expect(client.data[0]).to eq('HTTP/1.1 200 OK')
  end

  it 'writes the file to the client' do
    expect(client.data.last).to eq(file)
  end

  it 'writes the content type: image/jpeg to client' do
    expect(client.data[1]).to eq('Content-Type: image/jpeg')
  end
end

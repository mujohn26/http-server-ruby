require "rubygems"
require "rspec"
require_relative "../lib/image_route.rb"

class MockClient
  attr_reader :data

  def initialize
    @data = []
  end

  def puts(data)
    @data.push(data)
  end           
end

describe ImageRoute do
  it "returns nil from create_response" do
    client = MockClient.new
    image_route = ImageRoute.new
    expect(image_route.create_response(client)).to eq(nil)
  end

  it "writes the response line to client" do
    client = MockClient.new
    image_route = ImageRoute.new
    image_route.create_response(client)
    expect(client.data[0]).to eq("HTTP/1.1 200 OK\r\n")
  end

  it "writes the response line to client" do
    client = MockClient.new
    image_route = ImageRoute.new
    image_route.create_response(client)
    expect(client.data[0]).to eq("HTTP/1.1 200 OK\r\n")
  end

  it "writes the file to the client" do
    client = MockClient.new
    image_route = ImageRoute.new
    path = '/Users/john/Documents/kata/http-server-ruby/public/cat.png'
    filestring = File.binread path
    image_route.create_response(client, path)
    expect(client.data.last).to eq(filestring)
  end
end

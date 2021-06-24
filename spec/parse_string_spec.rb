require 'rubygems'
require 'rspec'
require_relative '../lib/parse_string'

describe UriParser do
  it 'Parses /detail?name=john request uri' do
    uri_parser = UriParser.new
    return_data = {
      path: '/detail',
      query_string: { 'name' => 'john' }
    }
    expect(uri_parser.request_uri_parser('/detail?name=john')).to eq(return_data)
  end

  it 'Parses /index request uri' do
    uri_parser = UriParser.new
    return_data = {
      path: '/index',
      query_string: nil
    }
    expect(uri_parser.request_uri_parser('/index')).to eq(return_data)
  end
  it 'Parses /directory?dir=/home&dir=/home2 request uri' do
    uri_parser = UriParser.new
    return_data = {
      path: '/directory',
      query_string: { 'dir' => '/home2' }
    }
    expect(uri_parser.request_uri_parser('/directory?dir=/home&dir=/home2')).to eq(return_data)
  end

  it 'Parses /directory?dir= request uri' do
    uri_parser = UriParser.new
    return_data = {
      path: '/directory',
      query_string: { 'dir' => '' }
    }
    expect(uri_parser.request_uri_parser('/directory?dir=')).to eq(return_data)
  end
end

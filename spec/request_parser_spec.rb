require 'rubygems'
require 'rspec'
require_relative '../lib/request_parser'

describe RequestParser do
  it 'Parses /detail?name=john request uri' do
    request_parser = RequestParser.new
    request_parser.add_line('GET /detail?name=john HTTP')
    return_data = {
      method: 'GET',
      path: '/detail',
      params: { 'name' => 'john' }
    }
    expect(request_parser.generate_request).to eq(return_data)
  end

  it 'Parses /index request uri' do
    request_parser = RequestParser.new
    request_parser.add_line('GET /index HTTP')
    return_data = {
      method: 'GET',
      path: '/index',
      params: nil
    }
    expect(request_parser.generate_request).to eq(return_data)
  end

  it 'Parses /directory?dir=/home&dir=/home2 request uri' do
    request_parser = RequestParser.new
    request_parser.add_line('GET /directory?dir=/home&dir=/home2  HTTP')
    return_data = {
      method: 'GET',
      path: '/directory',
      params: { 'dir' => '/home2' }
    }
    expect(request_parser.generate_request).to eq(return_data)
  end

  it 'Parses /directory?dir= request uri' do
    request_parser = RequestParser.new
    request_parser.add_line('GET /directory?dir=  HTTP')
    return_data = {
      method: 'GET',
      path: '/directory',
      params: { 'dir' => '' }
    }
    expect(request_parser.generate_request).to eq(return_data)
  end

  it 'has a method of POST in the return data' do
    request_parser = RequestParser.new
    request_parser.add_line('POST /form  HTTP')
    return_data = {
      method: 'POST',
      path: '/form',
      params: nil
    }
    expect(request_parser.generate_request).to eq(return_data)
  end
end

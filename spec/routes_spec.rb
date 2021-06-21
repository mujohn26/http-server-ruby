require 'rubygems'
require 'rspec'
require 'socket'
require_relative '../lib/server.rb'
require_relative '../lib/index_route.rb'
require_relative "../lib/time_route.rb"
require_relative "../lib/post_index_route.rb"

describe IndexRoute do
it "Returns home page on /index route" do
  index_route = IndexRoute.new 
  return_data={
    :status=> "HTTP/1.1 200 OK",
    :title=> 'current time',
    :message=> "home page"
  }
  expect(index_route.create_response).to eq(return_data)
end

it "Returns current on /time route" do
  time_route = TimeRoute.new 
  return_data={
    :status=> "HTTP/1.1 200 OK",
    :title=> 'current time',
    :message=> Time.now.strftime("%d/%m/%Y %H:%M")
  }
  expect(time_route.create_response).to eq(return_data)
end

it "Returns current on / route" do
  post_index_route = PostIndexRoute.new 
  return_data={
    :status=> "HTTP/1.1 200 OK",
    :title=> 'form',
    :message=> "
    <form  method='get'>
    <label for='name'>Name:</label><br>
    <input type='text' id='name' name='name'><br><br>
    <label for='occupation'>Occupation:</label><br>
    <input type='text' id='occupation' name='occupation'><br><br>
    <input type='submit' value='Submit'>
    </form>"
  }
  expect(post_index_route.create_response).to eq(return_data)
end
end
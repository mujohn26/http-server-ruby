require 'rubygems'
require 'rspec'
require 'socket'
require_relative '../lib/index_route.rb'


describe IndexRoute do
it "Returns home page on /index route" do
  index_route = IndexRoute.new 
  return_data={:status=>"HTTP/1.1 200 OK", :type=>"text/html", :message=>"<html><title>index</title><body><h1>homepage</h1></body></html>"}
  expect(index_route.create_response).to eq(return_data)
end

end
require 'rubygems'
require 'rspec'
require 'socket'
require_relative "../lib/post_index_route.rb"

describe PostIndexRoute do
it "Returns current on / route" do
  post_index_route = PostIndexRoute.new 
  return_data= {
            :status=> "HTTP/1.1 200 OK",
            :type=> 'text/html',
            :message=> "
            <html>
            <title>form</title>
            <body>
            <form  method='get'>
            <label for='name'>Name:</label><br>
            <input type='text' id='name' name='name'><br><br>
            <label for='occupation'>Occupation:</label><br>
            <input type='text' id='occupation' name='occupation'><br><br>
            <input type='submit' value='Submit'>
            </form>
            </body>
            </html>"

        } 

  expect(post_index_route.create_response).to eq(return_data)
end
end
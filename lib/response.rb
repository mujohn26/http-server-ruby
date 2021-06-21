require 'ostruct'

class Response
    def print_response(message_body, client)
    my_object = OpenStruct.new(message_body)
    message = "<html><title>#{my_object.title}</title><body style={{backgroundColor:'blue', color:'white'}}><h1>#{my_object.message}</h1></body></html>"
    client.puts "#{my_object.status}" 
    client.puts "Content-Type: text/html" 
    client.puts "Content-Length: #{message.length}" 
    client.puts ""
    client.puts message
    end
end
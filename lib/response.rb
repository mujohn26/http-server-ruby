require 'ostruct'

class Response
    def print_response(message_body, client)
    my_object = OpenStruct.new(message_body)
    client.puts "#{my_object.status}" 
    client.puts "Content-Type: #{my_object.Type}" 
    client.puts "Content-Length: #{my_object.message.length}" 
    client.puts ""
    client.puts my_object.message
    end
end
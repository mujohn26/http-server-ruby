require 'ostruct'
# response class
class Response
  def initialize(message, client)
    @message_body = message
    @client = client
  end

  def print_response
    my_object = OpenStruct.new(@message_body)
    @client.puts my_object.status.to_s
    @client.puts "Content-Type: #{my_object.type}"
    @client.puts "Content-Length: #{my_object.message.length}"
    @client.puts ''
    @client.puts my_object.message

    nil
  end
end

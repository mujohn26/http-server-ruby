class ImageRoute
    def create_response(client, filepath = '/Users/john/Documents/kata/http-server-ruby/public/cat.jpeg' mime_type='image/jpeg')
        file = File.binread filepath
        client.puts "HTTP/1.1 200 OK\r\n" 
        client.puts "Content-Type:  #{mime_type}\r\n"
        client.puts "Content-Length: #{file.length}" 
        client.puts "" 
        client.puts file   

        return nil
    end

end
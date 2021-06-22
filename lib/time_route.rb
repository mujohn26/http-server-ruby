class TimeRoute
     def create_response
    {
     :status=> "HTTP/1.1 200 OK",
     :type=> "text/html",
     :message=> "<html><title>time</title><body><h1>#{Time.now.strftime("%d/%m/%Y %H:%M")}</h1></body></html>"
    }      
    end
    
end
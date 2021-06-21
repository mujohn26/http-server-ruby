class TimeRoute
     def create_response
    {
     :status=> "HTTP/1.1 200 OK",
     :title=> "current time",
     :message=> Time.now.strftime("%d/%m/%Y %H:%M")
    }      
    end
    
end
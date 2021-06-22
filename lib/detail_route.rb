class DetailRoute
    def create_response(name, occupation)
    {
     :status=> "HTTP/1.1 200 OK",
     :type=> "text/html",
     :message=> "<html><title>detail</title><body><h1>Hello #{name}, the #{occupation}</h1></body></html>"
    }      
    end

    def name_occupation_getter(path)
    {
     :name=> path.split("&")[0].split("=")[1],
     :occupation =>path.split("&")[1].split("=")[1]
    }      
    end
end
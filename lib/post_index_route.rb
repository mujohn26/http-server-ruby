class PostIndexRoute
    def create_response 
        {
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
    end
    

end
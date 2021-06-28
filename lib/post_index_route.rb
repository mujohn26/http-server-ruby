# post index route
class PostIndexRoute
  def create_response(_request)
    {
      status: 'HTTP/1.1 200 OK',
      type: 'text/html',
      message: "
            <html>
            <title>form</title>
            <body>
            <form  method='get'>
            <label for='name'>Name:</label><br>
            <input type='text' id='name' name='name'><br><br>
            <label for='occupation'>Occupation:</label><br>
            <input type='text' id='occupation' name='occupation class='occupation'><br><br>
            <a href='/hello?name=#name&occupation=#occupation' >Submit</a>
            </form>
            </body>
            </html>"

    }
  end
end

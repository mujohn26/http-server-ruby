require_relative "./server.rb"
require_relative "./index_route.rb"
require_relative "./time_route.rb"
require_relative "./post_index_route.rb"
require_relative "./image_route.rb"

server = Server.new 9000

server.add_route "GET", "/index", IndexRoute
server.add_route "GET", "/time", TimeRoute
server.add_route "POST", "/", PostIndexRoute
server.add_route "GET", "/image", ImageRoute



server.start
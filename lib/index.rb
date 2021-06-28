require_relative './server'
require_relative './index_route'
require_relative './time_route'
require_relative './post_index_route'
require_relative './image_route'
require_relative './directory_route'
require_relative './detail_route'
require_relative './file_viewer_route'

server = Server.new 9000

server.add_route 'GET', '/index', IndexRoute.new
server.add_route 'GET', '/time', TimeRoute.new
server.add_route 'GET', '/hello', DetailRoute.new
server.add_route 'POST', '/', PostIndexRoute.new
server.add_route 'GET', '/image', ImageRoute.new('/Users/john/Documents/kata/http-server-ruby/public/cat.png')
server.add_route 'GET', '/image2', ImageRoute.new('/Users/john/Documents/kata/http-server-ruby/public/cat.jpg')
server.add_route 'GET', '/directory', DirectoryRoute.new('/Users/john/Documents/kata/http-server-ruby/public/')
server.add_route 'GET', '/public', FileViewerRoute.new('/Users/john/Documents/kata/http-server-ruby/public/')

# /directory/
# /directory/image.png
# /directory/does-not-exist.html
# /directory/index.html

server.start

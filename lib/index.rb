require_relative './server'
require_relative './index_route'
require_relative './time_route'
require_relative './post_index_route'
require_relative './image_route'
require_relative './directory_route'
require_relative './detail_route'
require_relative './file_viewer_route'
require_relative './redirect_route'
require_relative './form_route.rb'

server = Server.new 3030

server.add_route 'GET', '/index', IndexRoute.new
server.add_route 'GET', '/time', TimeRoute.new
server.add_route 'GET', '/hello', DetailRoute.new
server.add_route 'GET', '/', PostIndexRoute.new
server.add_route 'GET', '/redirect', RedirectRoute.new
server.add_route 'GET', '/image', ImageRoute.new('/Users/john/Documents/kata/http-server-ruby/public/cat.png')
server.add_route 'GET', '/image2', ImageRoute.new('/Users/john/Documents/kata/http-server-ruby/public/cat.jpg')
server.add_route 'GET', '/directory', DirectoryRoute.new('/Users/john/Documents/kata/http-server-ruby/public/')
server.add_route 'GET', '/public', FileViewerRoute.new('/Users/john/Documents/kata/http-server-ruby/public/')

server.add_route 'POST', '/form', FormRoute.new

server.start

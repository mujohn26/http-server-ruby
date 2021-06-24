require 'rubygems'
require 'rspec'
require 'socket'
require_relative '../lib/time_route'

describe TimeRoute do
  it 'Returns current on /time route' do
    time_route = TimeRoute.new
    return_data = { status: 'HTTP/1.1 200 OK', type: 'text/html',
                    message: "<html><title>time</title><body><h1>#{Time.now.strftime('%d/%m/%Y %H:%M')}</h1></body></html>" }
    expect(time_route.create_response(nil)).to eq(return_data)
  end
end

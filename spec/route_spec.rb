require 'rubygems'
require 'rspec'
require_relative '../lib/route'

describe Route do
    it 'returns the mathching GET route' do
        route = Route.new
        handler = 10
        routes = [{method: 'GET', path: '/path', handler: handler}]
        request = {method: 'GET', path: '/path', params: nil}

        actual_handler = route.get_handler(routes, request)

        expect(handler).to eq(actual_handler)
    end
    
    it 'returns the mathching POST route' do
        route = Route.new
        post_handler = 'post'
        get_handler = 'get'
        routes = [
            {method: 'GET', path: '/path', handler: get_handler},
            {method: 'POST', path: '/path', handler: post_handler},
        ]
        request = {method: 'POST', path: '/path', params: nil}

        actual_handler = route.get_handler(routes, request)

        expect(post_handler).to eq(actual_handler)
    end
end
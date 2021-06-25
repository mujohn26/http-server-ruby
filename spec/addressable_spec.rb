require 'rubygems'
require 'rspec'
require_relative '../lib/addressable'

describe Addressable do
  it 'Splits /detail?name=john request uri' do
    addressable = Addressable.new
    return_data = {
      path: '/detail',
      query_values: { 'name' => 'john' }
    }
    expect(addressable.uri('/detail?name=john')).to eq(return_data)
  end
  it 'Splits name=john request uri' do
    addressable = Addressable.new
    return_data = { 'name' => 'john' }
    expect(addressable.split_query_string('name=john')).to eq(return_data)
  end
end

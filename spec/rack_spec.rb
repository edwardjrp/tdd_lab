require 'rails_helper'
require 'sinatra'
require 'rack_app'

RSpec.fdescribe App do
  #Isolating integration tests for this describe block,
  #if put on spec_helper or rails_helper, rack test methods will be
  #available for all tests.
  include Rack::Test::Methods

  let(:app) { App }

  it 'creates a book' do
    #Rack http post method, (uri, params = {}, env = {}, &block)
    post '/books', book: {name: 'My first book'}
    expect(last_response.status).to eq 201 #Https status code for created
  end

end
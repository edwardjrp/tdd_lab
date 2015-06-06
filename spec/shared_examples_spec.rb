require 'rails_helper'
require 'apis'
require 'file_api'


#When sharing examples the 'shared_exmaples' or 'shared_examples_for' are exclusive attributes of RSpec, can't be arbitrary name
#Also the shared 'it' expectation must be inside a context otherwise wont work
RSpec.shared_examples_for 'API' do |api|

  context 'list products' do
    it 'lists products' do
      expect(api.list_products).to match [
                                             a_hash_including(
                                                 name: an_instance_of(String),
                                                 category: an_instance_of(String),
                                                 price: an_instance_of(Float)
                                             )
                                         ]
    end

  end

end

RSpec.describe WebApi do

  context 'web api and list products' do
    let(:api) {
      WebApi.new('http://localhost/9292')
    }

    it 'has a url' do
      expect(api).to respond_to :url
    end

    #Calling the shared it defined at the begining
    it_behaves_like 'API', WebApi.new('http://localhost/9292') #api

  end

end

RSpec.describe FileApi do

  let(:api) {
    FileApi.new '/etc/myapp/api.db'
  }

  it 'has a file location' do
    expect(api).to respond_to :location
  end

  it_behaves_like 'API', FileApi.new('/etc/myapp/api.db')

end


require 'rails_helper'
require 'blog'

RSpec.describe 'Callbacks' do

  let(:blog) {
    Blog.new
  }

  #Executes before each specific test is run
  # Also :example, :context are valid params for the callbacks events
  #The :suite is only used for global callbacks in the rspec spec_helper configuration file
  before(:each) do |each|
    blog.populate!
    puts each.inspect
  end

  it 'Has one post' do
    expect(blog.posts_count).to eq 1
  end

end

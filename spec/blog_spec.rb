require 'rails_helper'
require 'blog'
require 'post'

RSpec.describe Blog do

  context 'Blog with no posts' do
    #Before operations will be executed only inside this context
    # before(:context) {
    #
    # }

    let(:blog) {
      Blog.new
    }

    it 'Has no posts' do
      expect(blog).to be_empty
    end

  end

  context 'Blog with one post' do

    let(:blog) {
      Blog.new(posts: [Post.new])
    }

    it 'Has a post when initialized with one' do
      expect(blog).not_to be_empty
    end

    it 'Counts the number of posts' do
      expect(blog.posts_count).to eq 1
    end

  end

end
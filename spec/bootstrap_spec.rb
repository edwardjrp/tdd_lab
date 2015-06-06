require 'rails_helper'
#require 'spec_helper'
require 'bootstrap_demo'

RSpec.describe BootstrapDemo do

  context 'Welcome to hello world' do
    let(:bootstrap) {
      BootstrapDemo.new
    }

    # subject(:bootstrap) { BootstrapDemo.new  }

    it 'Should say hello' do
      expect(bootstrap.hello).to include 'Hello'
    end

  end

  context 'Show matchers use' do
    it 'Asserts equality' do
      number = 3
      expect(number).to eq 3
    end

    it 'Asserts on mathematical operators,so number should be greater >= 5' do
      number = 5
      expect(number).to be >= 5
    end

    it 'Asserts on matching a regular expression to an email pattern' do
      email = 'edwardjrp@gmail.com'
      email_pattern = /^\w+@\w+\.[a-z]{2,4}$/
      expect(email).to match email_pattern
    end

    it 'Asserts on types and classes, so a float object should be a Float, float being a class object' do
      object = 2.5
      expect(object).to be_an_instance_of Float

    end

    it 'Asserts on truthiness, so expecting a true value should be true' do
      bool = true
      expect(bool).to be true
    end

    it 'Expect errors' do
      expect do
        raise ArgumentError

      end.to raise_error ArgumentError
    end

    it 'Expects Throws' do
      expect {
        throw :oops
      }.to throw_symbol #throw_symbol :oops

    end

    #If add an x before it (xit) the test case will be skipped
    # it 'Asserts on predicates, So class a with method good should be true, use metaprogramming techniques, so be_good, good refers to method on class A', skip: true do
    # it 'Asserts on predicates, So class a with method good should be true, use metaprogramming techniques, so be_good, good refers to method on class A', skip: "Skiped temporary to prioritize other test" do
    # xit 'Asserts on predicates, So class a with method good should be true, use metaprogramming techniques, so be_good, good refers to method on class A' do
    it 'Asserts on predicates, So class a with method good should be true, use metaprogramming techniques, so be_good, good refers to method on class A' do
      # skip 'Another way of skip' #pending
      class A
        def good?
          true
        end
      end

      expect(A.new).to be_good

    end

    it 'Assert on collections' do
      list = [
          :one,
          :two,
          :three
      ]

      # expect(list).to include :one
      #expect(list).to start_with :one
      expect(list).to start_with [:one, :two]
      expect(list).to end_with [:two, :three]

    end

    it 'Negates asserts' do
      expect(3).not_to be 5
    end

    #focus on a specific test to improve speed in some cases when needed
    # fit 'is my very important test right now, so focus here' do
    # it 'is my very important test right now, so focus here', focus: true do
    it 'is my very important test right now, so focus here' do
      expect(true).to be_truthy
    end
    
  end

end
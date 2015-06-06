require 'rails_helper'

RSpec.describe 'Composable Matchers' do

  context 'Some complex nested expectations' do
    it 'Works with nested data' do
      class Product
        def initialize id, name, category
          @id = id
          @name = name
          @category = category
        end

        def serial_data
          [
              'X-',
              @name[0],
              @category[0],
              @id
          ]
        end
      end

      product = Product.new 2456, 'Tomato', 'Fruit'

      expect(product.serial_data).to contain_exactly(
        a_string_starting_with('X-'),
        a_string_starting_with('T'),
        a_string_starting_with('F'),
        a_value < 5000
      )
      # X-TF2456
      #Matchers
      #change
      #contain_exactly
      #include
      #yield_with_args(a_string, a_hash, a_string_starting_with, a_hash_including())
      #
      #Matchers arguments
      #a_string / a_string_starting_with / a_string_ending_with
      #a_hash / a_hash_including
      #a_value / a_value_within(0.5).of(3.145)
      #an_instance_of(Hash)
      #

    end

    it 'Compound matchers' do
      string = 'Joe'
      expect(string.length).to eq(3)
      expect(string).to start_with('J').and end_with('e').and be_a(String)
    end

  end

end
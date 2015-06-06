require 'rails_helper'
require 'price_calculator'

class Product
  attr_reader :price
  # def price
  # end
end

RSpec.describe 'Stubs' do
  let(:calculator) { PriceCalculator.new }

  it 'Provides stubs to simulate state' do
    # calculator.add double(price: 1.0)
    # calculator.add double(price: 100.25)
    # calculator.add instance_double('Product',price: 1.0)

    # first_product = instance_double('Product')
    product_stub = instance_double('Product')
    # allow(first_product).to receive(:price).and_return(1.0)
    # #The next stateme is equivalent, passing a block instead of using and_return
    # #But and_return you can have multiple values that will be used on subsequent calls
    # allow(first_product).to receive(:price) { 1.0 }
    allow(product_stub).to receive(:price).and_return(1.0, 100.25)

    #Since and_return has 2 elements as params, the 2 .add calls with first_product param
    #will iterate to the next element of the call on the param list
    # calculator.add instance_double('Product', price: 100.25)

    # calculator.add product_stub
    # calculator.add product_stub
    # Equivalent to the next statement
    2.times { calculator.add product_stub }

    expect(calculator.final_price).to eq 101.25

  end

  it 'Provide mocks to assert on message passing' do
    product_mock = double(:product)
    # expect(product_mock).to receive(:price).exactly(10).times.and_return(5) #any_args on arguments, also instead of with, once, twice, exactly
    # expect(product_mock).to receive(:price).at_least(3).times.and_return(5)

    #expect_any_instance_of(Product).to receive(:price).and_return(5)
    allow_any_instance_of(Product).to receive(:price).and_return(5)

    product = Product.new
    puts product.price

    # calculator.add product_mock
    # calculator.final_price

  end

end
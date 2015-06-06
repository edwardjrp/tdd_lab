class WebProduct
  attr_reader :name, :category, :price

  def initialize name, category, price
    @name = name
    @category = category
    @price = price
  end
end

class WebApi
  attr_reader :url

  def initialize url
    @url = url
  end

  def list_products
    #Here you will call the external web service that serves the list of products
    #and expect to return a ahash with products
    products = fetch_information_from_outside
    products.map do |product|
      {
          name: product.name,
          category: product.category,
          price: product.price
      }
    end
  end

  def fetch_information_from_outside
    [
        WebProduct.new("Tomato", "Fruit", 0.23)
    ]
  end

end
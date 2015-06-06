class PriceCalculator
  def add product
    products << product
  end

  def final_price
    @products.map(&:price).inject(&:+)
  end

  private
  def products
    @products ||= []
  end


end
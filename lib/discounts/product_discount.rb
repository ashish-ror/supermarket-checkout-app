class ProductDiscount
  attr_reader :multiple_quantity, :item, :discounted_price

  def initialize(multiple_quantity:, item:, discounted_price:)
    @multiple_quantity = multiple_quantity
    @item = item
    @discounted_price = discounted_price
  end

  def calculate_discount(basket, product_price)
    # Calculate  discount if order is in multiple of minimum quantity
		product_price * basket[item] - (discounted_price * (basket[item] / multiple_quantity) +
		product_price * (basket[item] % multiple_quantity))
  end
end

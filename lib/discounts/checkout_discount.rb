class CheckoutDiscount
  attr_reader :percentage, :limit

  def initialize(percentage:, limit:)
    @percentage = percentage
    @limit = limit
  end

  def calculate_discount(basket, total_price)
  	# Calculate percentage discount if order is greater than limit set
    total_price > limit ? (total_price * percentage / 100.0) : 0
  end
end

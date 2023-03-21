require_relative 'price_calculator'

class Checkout
  include PriceCalculator
  attr_reader :pricing_rules, :products, :basket

  def initialize(pricing_rules, products: [])
    @pricing_rules = pricing_rules
    @products = products
    @basket = Hash.new(0)
  end

  def scan(item)
    raise "Invalid item: #{item}" unless valid_item?(item)
    @basket[item] += 1
  end

  def total
    #Calculate basket total after discount
    "£ #{calculate_final_price}"
  end

  private

  def valid_item?(item)
    #Check if item is valid to be processed
    products.map(&:item).include?(item)
  end
end

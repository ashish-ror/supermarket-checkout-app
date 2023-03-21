module PriceCalculator

  def calculate_final_price
    @product_price_store = products.map { |product| [product.item, product.price] }.to_h
    total_price = original_price.to_f
    # Calculate the total price for each item after discount
    pricing_rules.map do |discount_rule|
      product_price = @product_price_store[discount_rule.item] rescue total_price
      total_price -= discount_rule.calculate_discount(basket, product_price)
    end
    total_price
  end

  def original_price
    price = 0
    # Calculate the total price of basket before discount
    basket.each do |item, quantity|
      price += (quantity * @product_price_store[item])
    end
    price
  end
end

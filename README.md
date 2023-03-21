# SuperMarket Checkout Application

It does a supermarket checkout for a given basket and applies all given discounts 

# Installation Instructions

You will require Ruby to run this application.

Simply clone the repo and do bundle install to install all the gems

# Usage Instructions

After cloning the repo, please use command 'irb' to open Interactive Ruby.


# Import all the files used to run the application smoothly
require_relative 'lib/checkout'
require_relative 'lib/product'
require_relative 'lib/discounts/product_discount'
require_relative 'lib/discounts/checkout_discount'

# Add product into store
product_1 = Product.new(item: 'A', price: 50)
product_2 = Product.new(item: 'B', price: 30)
product_3 = Product.new(item: 'C', price: 20)

# Store them in array to use as an argument during checkout
products = [product_1, product_2, product_3]

# Add supermarket discount 
product_discount_1 = ProductDiscount.new(multiple_quantity: 2, item: "A", discounted_price: 90)
product_discount_2 = ProductDiscount.new(multiple_quantity: 3, item: "B", discounted_price: 75)
checkout_discount_1 = CheckoutDiscount.new(percentage: 10, limit: 200)

pricing_rules = [product_discount_1, product_discount_2, checkout_discount_1]


# Checkout the basket when ready by initializing it
checkout = Checkout.new(pricing_rules, products: products)

# Scan the products
checkout.scan('B')
checkout.scan('A')
checkout.scan('B')
checkout.scan('B')
checkout.scan('A')

# Calculate total basket value
price = checkout.total
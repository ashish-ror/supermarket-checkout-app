require_relative '../lib/checkout'
require_relative '../lib/discounts/product_discount'
require_relative '../lib/product'

describe Checkout do
  let(:pricing_rules) { [ProductDiscount.new(multiple_quantity: 2, item: "A", discounted_price: 90)] }
  let(:product) { Product.new(item: 'A', price: 50) }
  let(:products) { [product] }
  let(:checkout) { Checkout.new(pricing_rules, products: products) }

  describe '#scan' do
    it 'raises error on in-valid product code' do
      expect{ checkout.scan('D') }.to raise_error 'Invalid item: D'
    end
  end

  describe '#total' do
    it 'return the total value of cart after any discount' do
      checkout.scan('A')
      checkout.scan('A')
      checkout.scan('A')
      checkout.scan('A')
      expect(checkout.total).to eq '£ 180.0'
    end
  end
end

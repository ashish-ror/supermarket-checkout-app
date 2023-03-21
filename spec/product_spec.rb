require_relative '../lib/product'

describe Product do
  let(:product) { Product.new(item: 'A', price: 50) }

  describe '#item' do
    it 'return the item of the product' do
      expect(product.item).to eq 'A'
    end
  end

  describe '#price' do
    it 'return the price of the product' do
      expect(product.price).to eq 50
    end
  end
end

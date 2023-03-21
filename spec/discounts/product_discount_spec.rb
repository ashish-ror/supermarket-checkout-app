require_relative '../../lib/discounts/product_discount'

describe ProductDiscount do
	let(:product_discount) { ProductDiscount.new(multiple_quantity: 2, item: "A", discounted_price: 90) }

  describe '#calculate_discount' do
    it 'is expected to calculate the discount value applicable' do
      expect(product_discount.calculate_discount({'A' => 2}, 50)).to eq 10
    end
  end
end

require_relative '../../lib/discounts/checkout_discount'

describe CheckoutDiscount do
  let(:checkout_discount) { CheckoutDiscount.new(percentage: 10, limit: 200) }

  describe '#calculate_discount' do
    it 'is expected to calculate the discount value if applicable' do
      expect(checkout_discount.calculate_discount({'A' => 2}, 210)).to eq 21
      expect(checkout_discount.calculate_discount({'A' => 2}, 50)).to eq 0
    end
  end
end

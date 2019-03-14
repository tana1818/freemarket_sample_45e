require 'rails_helper'

describe Product do
  describe '#create' do
    it "is valid with all columns" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "is invalid without a name" do
     # product = Product.new(name: "", description: "", large_category: 1, middle_category: 1, small_category: 1, condition_id: 1, delivery_fee_pay_id: 1, delivery_method_id: 1, prefecture_id: 1, shipment_period_id: 1, price: 300, status: 1, size_id: 1, brand: 1, images: ["aaa.jpg"], user_id: 1)
     product = build(:product, name: '', description: '')
     # product = create(:product)
     product.valid?
     expect(product.errors[:name]).to include("is too short (minimum is 1 character)")
     expect(product.errors[:description]).to include("is too short (minimum is 1 character)")
    end
  end
end

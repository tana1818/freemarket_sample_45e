require 'rails_helper'
describe Product do
  describe '#create' do
    it "is invalid without a name" do

     product = Product.new(name: "", description: "あ", large_category: 1, middle_category: 1, small_category: 1, condition: 1, delivery_fee_pay: 1, delivery_method: 1, prefecture_id: 1, shipment_period: 1, price: 300, status: 1, size: 1, brand: 1, images: "[aaa.jpg]", user: 1)
     product.valid?
     expect(product.errors[:name]).to include("can't be blank")

    end
  end
end

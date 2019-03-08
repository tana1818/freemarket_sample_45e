class Product < ApplicationRecord
  belongs_to :Category
  belongs_to :condition
  belongs_to :delivery_fee_pay
  belongs_to :delivery_method
  belongs_to :prefecture
  belongs_to :shipment_period
  belongs_to :size
  belongs_to :user
  has_many :images
  has_many :comments
  has_many :likes
  has_many :purchases
end

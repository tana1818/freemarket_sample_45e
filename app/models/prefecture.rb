class Prefecture < ApplicationRecord
  has_many :user_details
  has_many :deliveries
  has_many :products
end

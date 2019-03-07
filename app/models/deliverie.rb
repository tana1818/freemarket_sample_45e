class Deliverie < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  has_many :purchases
end

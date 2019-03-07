class Size < ApplicationRecord
  belongs_to :size_kind
  has_many :products
end

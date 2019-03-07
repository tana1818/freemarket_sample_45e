class SizeKind < ApplicationRecord
  has_many :sizes
  has_many :categories
end

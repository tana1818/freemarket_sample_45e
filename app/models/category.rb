class Category < ApplicationRecord
  belongs_to :small_category
  belongs_to :middle_category
  belongs_to :large_category
  belongs_to :size_kind
end

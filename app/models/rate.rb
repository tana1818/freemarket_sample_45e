class Rate < ApplicationRecord
  belongs_to :score
  belongs_to :purchase
  belongs_to :user
end

class Card < ApplicationRecord
  belongs_to :user
  has_many :purchases

  validates :card_number, presence: true
  validates :expiration_month, presence: true
  validates :expiration_year, presence: true
  validates :security_code, presence: true,length: { maximum: 4 }

end

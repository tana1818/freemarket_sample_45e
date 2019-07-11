class Card < ApplicationRecord
  # belongs_to :user
  has_many :purchases

  validates :card_number, numericality: true, presence: true
  validates :expiration_month, presence: true
  validates :expiration_year, presence: true
  validates :security_code, numericality: true, presence: true,format: { with: /\A\d{3,4}\z/ }
end

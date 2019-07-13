class Deliverie < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :prefecture
  has_many :purchases

  validates :sei, presence: true
  validates :mei, presence: true
  validates :kana_sei, presence: true
  validates :kana_mei, presence: true
  validates :zip_code, presence: true
  validates :shikutyoson, presence: true
  validates :banchi, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end

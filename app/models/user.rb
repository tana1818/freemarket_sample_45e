class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_detail
  accepts_nested_attributes_for :user_detail
  has_one :delivery
  accepts_nested_attributes_for :delivery
  has_one :purchases
  has_many :cards
  accepts_nested_attributes_for :cards
  has_many :products
  has_many :comments
  has_many :likes
  has_many :rates

end

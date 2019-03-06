class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_detail
  has_one :delivery
  has_one :card
  has_many :products
  has_many :comments
  has_many :likes
  has_many :purchases
  has_many :rates
  
end

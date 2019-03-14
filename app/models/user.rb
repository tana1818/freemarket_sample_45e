class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_one :user_detail
  accepts_nested_attributes_for :user_detail
  has_one :deliverie, dependent: :destroy
  accepts_nested_attributes_for :deliverie
  has_one :purchase, dependent: :destroy
  has_one :card, dependent: :destroy
  accepts_nested_attributes_for :card
  has_many :products
  has_many :comments
  has_many :likes
  has_many :rates

  validates :nickname, presence: true
  validates :sei, presence: true
  validates :mei, presence: true
  validates :kana_sei, presence: true
  validates :kana_mei, presence: true
  validates :birth, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.nickname = auth.info.name
      user.uid = auth.uid
      user.provider = auth.provider
    end
  end

end

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
  has_many :purchases
  has_many :rates

  validates :nickname, presence: true
  validates :sei, presence: true
  validates :mei, presence: true
  validates :kana_sei, presence: true
  validates :kana_mei, presence: true
  validates :birth, presence: true

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        nickname:     auth.info.name,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end

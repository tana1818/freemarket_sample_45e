class UserDetail < ApplicationRecord
  belongs_to :user
  has_many :prerfectures

  validates :auth_tel, presence: true,numericality: true,length: { maximum: 10 }

end

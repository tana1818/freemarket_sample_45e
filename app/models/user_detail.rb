class UserDetail < ApplicationRecord
  belongs_to :user, optional: true
  has_many :prerfectures

  validates :auth_tel, presence: true,numericality: true,length: { maximum: 11 }

end

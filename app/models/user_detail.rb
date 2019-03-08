class UserDetail < ApplicationRecord
  belongs_to :user
  has_many :prerfectures
end

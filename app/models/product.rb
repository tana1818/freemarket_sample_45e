class Product < ApplicationRecord
  belongs_to :image
  belongs_to :user
  belongs_to :size
  belongs_to :condition
  belongs_to :delivery_fee_pay
  belongs_to :delivery_method
  belongs_to :shipment_period
  belongs_to :large_categorie
  belongs_to :middle_categorie
  belongs_to :small_categorie
  has_many :comments
  # mount_uploader :image_id, ImageUploader
end

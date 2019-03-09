class Product < ApplicationRecord
  belongs_to :image

  # mount_uploader :image_id, ImageUploader
end

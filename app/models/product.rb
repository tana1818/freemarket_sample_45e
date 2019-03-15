class Product < ApplicationRecord
  belongs_to :condition
  belongs_to :delivery_fee_pay
  belongs_to :delivery_method
  belongs_to :shipment_period
  has_many :comments
  belongs_to :size
  belongs_to :user
  has_many :likes
  has_many :purchases
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  mount_uploaders :images, ImageUploader
  serialize :images, JSON

  validates :name, length: {in: 1..40}
  validates :description, length: {in: 1..1000}
  validates :large_category, presence: true
  validates :middle_category, presence: true
  validates :small_category, presence: true
  validates :condition, presence: true
  validates :delivery_fee_pay, presence: true
  validates :delivery_method, presence: true
  validates :prefecture_id, presence: true
  validates :shipment_period, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :status, presence: true
  validates :size, presence: true
  validates :images, presence: true
  validates :user, presence: true


  def product_by_large_category(id)
    Product.where(large_category: id).order("id DESC").limit(4)
  end

  def product_by_brand_category(id)
    Product.where(brand: id).order("id DESC").limit(4)
  end
  
end

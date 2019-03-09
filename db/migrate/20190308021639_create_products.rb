class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :status
      t.string :brand
      t.references :category, foreign_key: true
      t.references :condition, foreign_key: true
      t.references :delivery_fee_pay, foreign_key: true
      t.references :delivery_method, foreign_key: true
      t.references :prefecture, foreign_key: true
      t.references :shipment_period, foreign_key: true
      t.references :size, foreign_key: true
      t.references :user, foreign_key: true
      t.references :image, foreign_key: true
      t.timestamps
    end
  end
end

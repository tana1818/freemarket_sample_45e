class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :text, null: false
      t.integer :price, null: false
      t.string :status, null: false
      t.string :brand, null: false
      t.references :category, null: false, foreign_key: true
      t.references :condition, null: false, foreign_key: true
      t.references :delivery, null: false, foreign_key: true
      t.references :prefecture, null: false, foreign_key: true
      t.references :shipment_period, null: false, foreign_key: true
      t.references :delivery_method, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

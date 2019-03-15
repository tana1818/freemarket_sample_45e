class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :status
      t.string :brand
      t.references :category
      t.references :condition
      t.references :delivery_fee_pay
      t.references :delivery_method
      t.references :prefecture
      t.references :shipment_period
      t.references :size
      t.references :user
      t.references :image
      t.references :small_categorie
      t.references :middle_categorie
      t.references :large_categorie

      t.timestamps
    end
  end
end

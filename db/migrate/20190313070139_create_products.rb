class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string      :name, null: false
      t.text        :description, null: false
      t.integer     :small_category, null: false
      t.references  :condition, foreign_key: true, null: false
      t.references  :delivery_fee_pay, foreign_key: true, null: false
      t.references  :delivery_method, foreign_key: true, null: false
      t.integer     :prefecture_id, null: false
      t.references  :shipment_period, foreign_key: true, null: false
      t.integer     :price, null: false
      t.string      :status, null: false
      t.references  :size, foreign_key: true, null: false
      t.string      :brand
      t.string      :images, null: false
      t.references  :user, foreign_key: true, null: false
      t.timestamps  null: false
    end
  end
end

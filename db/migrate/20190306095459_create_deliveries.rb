class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :sei, null: false
      t.string :mei, null: false
      t.string :kana_sei, null: false
      t.string :kana_mei, null: false
      t.integer :zip_code, null: false
      t.string :shikutyoson, null: false
      t.string :banchi, null: false
      t.string :tatemono, null: false
      t.integer :tel, null: false
      t.references :user, foreign_key: true
      t.references :prefecture, foreign_key: true
      t.timestamps
    end
  end
end

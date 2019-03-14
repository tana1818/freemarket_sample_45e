class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :sei, null: false
      t.string :mei, null: false
      t.string :kana_sei, null: false
      t.string :kana_mei, null: false
      t.string :zip_code, null: false
      t.string :shikutyoson, null: false
      t.string :banchi, null: false
      t.string :tatemono
      t.integer :tel
      t.references :user, foreign_key: true
      t.integer :prefecture_id
      t.timestamps
    end
  end
end

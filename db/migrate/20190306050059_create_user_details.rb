class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.string :sei, null: false
      t.string :mei, null: false
      t.string :kana_sei, null: false
      t.string :kana_mei, null: false
      t.date :birth, null: false
      t.integer :auth_tel, null: false
      t.integer :zip_code
      t.string :shikutyoson
      t.string :banchi
      t.string :tatemono
      t.string :avater_image
      t.references :user, foreign_key: true
      t.references :prefecture, foreign_key: true
      t.timestamps
    end
  end
end

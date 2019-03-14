class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
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

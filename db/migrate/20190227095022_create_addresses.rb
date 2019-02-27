class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.string :sei, null: false
      t.string :mei, null: false
      t.string :kana_sei, null: false
      t.string :kana_mei, null: false
      t.string :zip_code, null: false
      t.string :sityouson, null: false
      t.string :banchi, null: false
      t.string :tatemono, null: false
      t.string :tell, null: false

      t.references :todouhuken, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      # t.timestamps
    end
  end
end

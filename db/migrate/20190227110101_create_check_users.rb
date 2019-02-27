class CreateCheckUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :check_users do |t|

      t.string :sei, null: false
      t.string :mei, null: false
      t.string :kana_sei, null: false
      t.string :kana_mei, null: false
      t.date :birth, null: false

      t.references :user, foreign_key: true, index: true
      # t.timestamps
    end
  end
end

class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.string :rating_type, null: false
      t.text :comment, null: false
      t.references :reputation, null: false, foreign_key: true
      t.references :purchase, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

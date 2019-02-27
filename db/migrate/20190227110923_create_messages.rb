class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|

      t.text :text
      t.timestamps

      t.references :produt, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
    end
  end
end

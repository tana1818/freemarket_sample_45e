class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|

      t.string :name, null: false
      t.integer :sort_by, null: false
      t.references :size_kind 
      t.timestamps
    end
  end
end

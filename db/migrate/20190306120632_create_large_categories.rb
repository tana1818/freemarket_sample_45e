class CreateLargeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :large_categories do |t|
      t.string :name, null: false
      t.integer :sort_by, null: false
      t.timestamps
    end
  end
end

class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :sort_by, null: false
      t.integer :is_brand_presence
      t.references :size_kind
      t.references :large_category,null: false, foreign_key: true
      t.references :middle_category,null: false, foreign_key: true
      t.references :small_category,null: false, foreign_key: true
      t.timestamps
    end
  end
end

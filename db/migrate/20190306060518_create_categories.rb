class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string      :name, null: false
      t.integer     :division
      t.integer     :sort_by, null: false
      t.integer     :size_kind_id
      t.integer     :is_brand_presence
      t.timestamps  null: false
    end
  end
end

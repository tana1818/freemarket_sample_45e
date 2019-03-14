class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string      :name, null: false
      t.integer     :sort_by, null: false
      t.integer     :size_kind_id, null: false
      t.timestamps  null: false
    end
  end
end

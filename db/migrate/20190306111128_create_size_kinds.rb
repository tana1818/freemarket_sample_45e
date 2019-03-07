class CreateSizeKinds < ActiveRecord::Migration[5.2]
  def change
    create_table :size_kinds do |t|

      t.string :name, null: false
      t.timestamps
    end
  end
end

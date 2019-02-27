class CreateTodouhukens < ActiveRecord::Migration[5.2]
  def change
    create_table :todouhukens do |t|

      t.string :todouhuken_name
      # t.timestamps
    end
  end
end

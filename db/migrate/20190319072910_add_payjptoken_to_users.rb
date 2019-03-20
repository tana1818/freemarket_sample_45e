class AddPayjptokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :payjptoken, :string
  end
end

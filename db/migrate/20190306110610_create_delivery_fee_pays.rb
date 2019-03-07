class CreateDeliveryFeePays < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_fee_pays do |t|

      t.string :name, null: false
      t.integer :sort_by, null: false
      t.timestamps
    end
  end
end

class CreateReputations < ActiveRecord::Migration[5.2]
  def change
    create_table :reputations do |t|

      t.timestamps
      t.string :score
    end
  end
end

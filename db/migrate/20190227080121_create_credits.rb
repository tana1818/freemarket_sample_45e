class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|


      t.string :payjp_token
      # t.varchar :creca_num, null:false, unique:true (20)
      # t.integer :security_code, null:false
      # t.string :expier_month
      # t.string :expier_year
      t.references :user, foreign_key: true, index: true
      # t.timestamps
    end
  end
end

class AddUserIdToCaregivers < ActiveRecord::Migration
  def change

  	add_column :caregivers, :user_id, :integer
  	add_index :caregivers, :user_id
  end
end

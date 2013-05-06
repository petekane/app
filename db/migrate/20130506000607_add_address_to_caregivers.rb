class AddAddressToCaregivers < ActiveRecord::Migration
  def change
    add_column :caregivers, :address, :string
  end
end

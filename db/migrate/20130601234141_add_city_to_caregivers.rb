class AddCityToCaregivers < ActiveRecord::Migration
  def change
    add_column :caregivers, :city, :string
  end
end

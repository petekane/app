class AddLatitudeAndLongitudeToCaregivers < ActiveRecord::Migration
  def change
    add_column :caregivers, :latitude, :float
    add_column :caregivers, :longitude, :float
  end
end

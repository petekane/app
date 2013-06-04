class AddOrganizationToCaregivers < ActiveRecord::Migration
  def change
    add_column :caregivers, :organization, :string
  end
end

class CreateCaregivers < ActiveRecord::Migration
  def change
    create_table :caregivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :zip_code
      t.string :job_title
      t.string :years_experience
      t.text :bio

      t.timestamps
    end
  end
end

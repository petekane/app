class Caregiver < ActiveRecord::Base
  attr_accessible :bio, :email, :first_name, :job_title, :last_name, :phone_number, :years_experience, :zip_code
end

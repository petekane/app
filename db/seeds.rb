# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env.production?
  raise "rake db:seed has been disabled for the production environment"
end


require 'faker'
i_first = 1000000
i_last = i_first + 10
for i in i_first..i_last
  fn = Faker::Name.first_name
  ln = Faker::Name.last_name
  email = Faker::Internet.email
  pw = Faker::Lorem.characters(8)
  phone = Faker::PhoneNumber.phone_number
  city = Faker::Address.city
  zip = Faker::Address.zip_code
  o = Faker::Company.name
  title_list = ['EMT', 'RN', 'Personal Care Assistant', \
    'Case Manager', 'Therapist']
  jt = title_list.sample
  y = (1..30).to_a.sample
  b = Faker::Lorem.paragraphs
  grav_id = Digest::MD5.hexdigest(email)
  grav_url = "http://gravatar.com/avatar/#{grav_id}"
  a = File.open("./app/assets/images/avatar_default/icon.png", 'r')
  caregiver = Caregiver.new(first_name: fn, last_name: ln, \
    email: email, phone_number: phone, city: city, \
    zip_code: zip, organization: o, job_title: jt, \
    years_experience: y, bio: b, password: pw, \
    password_confirmation: pw, \
    avatar: a)
  caregiver.save!
end
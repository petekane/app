class Caregiver < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :bio, :first_name, :job_title, :last_name, :phone_number, :years_experience, :zip_code, :city, :organization, :avatar
  attr_accessible :address

  validates :bio, presence: true
  validates :first_name, presence: true
  
  validates :job_title, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :years_experience, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true


  geocoded_by :zip_code
  after_validation :geocode 
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
  has_attached_file :avatar, :styles => { :square => "150x150#" }, default_url: "avatar_default.png"

  validates_attachment_presence :avatar
  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
end
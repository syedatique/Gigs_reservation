class Gig < ActiveRecord::Base
  belongs_to  :genre
  has_many :schedules 
  has_many :venues, through: :schedules
  has_many :viewings
  # has_many :users, through: :viewings

  mount_uploader :gig_image, GigImageUploader
  

end

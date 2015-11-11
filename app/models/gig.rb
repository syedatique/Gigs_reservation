class Gig < ActiveRecord::Base
  belongs_to  :genre
  has_many :schedules 
  has_many :venues, through: :schedules

  mount_uploader :gig_image, GigImageUploader
  
end

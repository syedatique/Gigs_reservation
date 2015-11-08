class Venue < ActiveRecord::Base
  has_many :schedules 
  has_many :gigs, through: :schedules
end

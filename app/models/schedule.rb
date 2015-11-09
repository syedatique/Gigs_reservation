class Schedule < ActiveRecord::Base
  belongs_to  :venue
  belongs_to  :gig
  has_many  :bookings
  has_many :users, :through => :bookings
end

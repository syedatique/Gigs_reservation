class Schedule < ActiveRecord::Base
  belongs_to  :venue
  belongs_to  :gig
  has_many  :bookings
  has_many :users, :through => :bookings

  def human_readable_date
    schedule.strftime("%d %B %Y %r")
    
  end


end

class Schedule < ActiveRecord::Base
  belongs_to  :venue
  belongs_to  :gig
end

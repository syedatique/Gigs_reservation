class Booking < ActiveRecord::Base

  belongs_to :schedule
  belongs_to :user

  def self.how_many_tickets(schedule_id, user_id)
    where(schedule_id: schedule_id, user_id: user_id).count
  end

end

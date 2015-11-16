class Schedule < ActiveRecord::Base
  belongs_to  :venue
  belongs_to  :gig
  has_many  :bookings
  has_many :users, :through => :bookings

  def human_readable_date
    schedule.strftime("%d %B %Y %r")
  end

  def schedule_exist_at_venue?(venue_id)
    Schedule.where(venue_id: venue_id).all? {|s| s.schedule != self.schedule}
  end

  def number_of_seat_available
    capacity = venue.seat
    total_booking = Booking.where(schedule_id: id).count
    number_of_seat_available = capacity - total_booking
  end

  def seat_availability
    number_available = number_of_seat_available
    venue.seat > number_available
  end

  def search_result(name)
    # binding.pry
    # gig_matches = Gig.where("name like ?", "%#{params[:name]}%")
    # venue_matches = Venue.where("name like ?", "%#{params[:name]}%")
    # schedule_gig = Schedule.where(:gig_id => gig_matches.id)
    
    gig_matches = Gig.where("name like ?", "%#{name}%")
    venue_matches = Venue.where("name like ?", "%#{name}%")
    # binding.pry

    schedule_gig = gig_matches.map {|gig| Schedule.where(:gig_id => gig.id) }
    schedule_venue = venue_matches.map {|venue| Schedule.where(:venue_id => venue.id) }

    ((schedule_gig + schedule_venue).flatten).uniq
  end


end

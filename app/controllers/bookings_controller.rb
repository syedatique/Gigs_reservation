class BookingsController < ApplicationController

  load_and_authorize_resource :only => [:edit, :delete]

  def new
    @booking = Booking.new()
    @schedule = Schedule.find(params[:schedule_id])
    # binding.pry
  end

  def create
    @booking = Booking.create(booking_params.merge(user_id: current_user.id))
    redirect_to schedule_bookings_path
    # binding.pry
  end

private
def booking_params
  params.permit(:schedule_id)
end


end
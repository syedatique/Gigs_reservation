class BookingsController < ApplicationController

  # load_and_authorize_resource 
  # before_action :authenticate_user!

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new()
    @schedule = Schedule.find(params[:schedule_id])
    # binding.pry
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @schedule = Schedule.find(params[:schedule_id])
    # if @schedule.users.where(email: current_user.email).count > 0
    #   redirect_to schedules_path, alert: "You've already booked this show"
    # elsif

    # else
    a = @schedule.venue.seat
    b = Booking.where(schedule_id: @schedule.id).count
    if 5 > b
      @booking = Booking.create(booking_params.merge(user_id: current_user.id))
      redirect_to schedule_booking_path(params[:schedule_id], @booking.id)
    else
      redirect_to schedules_path, alert: "No seat available!!"
    end
  end

  def update
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

private
def booking_params
  params.permit(:schedule_id)
end


end
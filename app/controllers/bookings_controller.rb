class BookingsController < ApplicationController

  load_and_authorize_resource 
  before_action :authenticate_user!

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
    @booking = Booking.create(booking_params.merge(user_id: current_user.id))
    redirect_to schedule_booking_path(params[:schedule_id], @booking.id)
    # binding.pry
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
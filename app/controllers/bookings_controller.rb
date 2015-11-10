class BookingsController < ApplicationController

  # load_and_authorize_resource 
  # before_action :authenticate_user!

  def index
    if current_user.role == 'admin'
      @bookings = Booking.all
    else
      @bookings = Booking.where(user_id: current_user.id, schedule_id: params[:schedule_id])
    end
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
    # @schedule = Schedule.find(params[:schedule_id])
    # if @schedule.users.where(email: current_user.email).count > 0
    #   redirect_to schedules_path, alert: "You've already booked this show"
    # else
    # binding.pry
    tickets_amount = params[:amount][:amount].to_i
    if seat_availability
      tickets_amount.times do 
        @booking = Booking.create(booking_params.merge(user_id: current_user.id))
      end
      redirect_to schedule_bookings_path(params[:schedule_id])
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

def seat_availability
  @schedule = Schedule.find(params[:schedule_id])
  capacity = @schedule.venue.seat
  total_booking = Booking.where(schedule_id: @schedule.id).count
  capacity > total_booking
end


end
class BookingsController < ApplicationController

  def index
    if current_user.role == 'admin'
      @bookings = Booking.all
    else
      @booking = Booking.where(user_id: current_user.id, schedule_id: params[:schedule_id]).first
    end
  end

  def new
    @booking = Booking.new()
    @schedule = Schedule.find(params[:schedule_id])
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    tickets_amount = params[:amount][:amount].to_i
    schedule = Schedule.find(params[:schedule_id])
  # Seat must be available to allocate, ALSO user is limited to buy Max 5 Tickets
    if schedule.seat_availability && tickets_amount < 6
      tickets_amount.times do 
        @booking = Booking.create(booking_params.merge(user_id: current_user.id))
      end
      redirect_to schedule_bookings_path(params[:schedule_id])
    else
      redirect_to schedules_path, alert: "Can't Process your order; No seat available or You have exceed your Ticket Limit (Limited to 5 for each user)!!"
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
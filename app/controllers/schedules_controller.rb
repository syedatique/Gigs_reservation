class SchedulesController < ApplicationController
  
  before_action :authenticate_user!
  
  load_and_authorize_resource
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    if params[:name]
      @schedule = Schedule.new
      @schedules = @schedule.search_result("#{params[:name]}")
      # binding.pry
    else
      @schedules = Schedule.all
      @bookings = Booking.where(user_id: current_user.id)
    end
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.schedule_exist_at_venue?(@schedule.venue_id)
      respond_to do |format|
        if @schedule.save
          format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
          format.json { render :show, status: :created, location: @schedule }
        else
          format.html { render :new }
          format.json { render json: @schedule.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, alert: "Venue has already been booked" 
    end
  end


  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
  
  def schedule_params
    params.require(:schedule).permit(:gig_id, :venue_id, :schedule, :user_ids=>[])
  end

end
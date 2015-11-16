class GigsController < ApplicationController

  load_and_authorize_resource

  before_action :authenticate_user!

  before_action :set_gig, only: [:show, :edit, :update, :destroy]




  def index
    if params[:name]
      @gigs = Gig.where("name like ?", "%#{params[:name]}%")
    else
      @gigs = Gig.all
    end
  end

  def show
    @gig = Gig.find(params[:id])
    @schedules = Schedule.where(gig_id: params[:id])
  end

  def new
    @gig = Gig.new
    @venues = Venue.new
  end

  def edit
    @venues = Venue.new
  end

  def create
    @gig = Gig.new(gig_params)

    respond_to do |format|
      if @gig.save
        format.html { redirect_to @gig, notice: 'Gig was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @gig.update(gig_params)
        format.html { redirect_to @gig, notice: 'Gig was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @gig.destroy
    respond_to do |format|
      format.html { redirect_to gigs_url, notice: 'Gig was successfully destroyed.' }
    end
  end


  private
  def set_gig
    @gig = Gig.find(params[:id])
  end

  def gig_params
    params.require(:gig).permit(:name, :description, :genre_id, :gig_image, :venue_ids=>[])
  end
end

class VenuesController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!

  before_action :set_venue, only: [:show, :edit, :update, :destroy]


  def index
    if params[:name]
    @venues = Venue.where("name like ?", "%#{params[:name]}%")
    else
    @venues = Venue.all
    end
  end

  def show
  end

  def new
    @venue = Venue.new
    @gigs = Gig.new
  end

  def edit
    @gigs = Gig.new
  end

  def create
    @venue = Venue.new(venue_params)

    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url, notice: 'Venue was successfully destroyed.' }
    end
  end

  private
  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :address, :seat, :gig_ids=>[])
  end
end
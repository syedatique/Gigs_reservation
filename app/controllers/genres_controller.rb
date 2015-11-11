class GenresController < ApplicationController
  
  before_action :authenticate_user!
  load_and_authorize_resource

  before_action :set_genre, only: [:show, :edit, :update, :destroy]

  def index
    if params[:name]
    @genres = Genre.where("name like ?", "%#{params[:name]}%")
    else
    @genres = Genre.all
    end
  end

  def show
  end

  def new
    @genre = Genre.new
  end

 
  def edit
  end

  def create
    @genre = Genre.new(genre_params)
  end

  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to @genre, notice: 'Genre was successfully updated.' }
        format.json { render :show, status: :ok, location: @genre }
      else
        format.html { render :edit }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: 'Genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def genre_params
    params.require(:genre).permit(:name)
  end
end

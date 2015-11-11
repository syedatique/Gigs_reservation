class UsersController < ApplicationController

  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    @schedule = Schedule.new
  end

  def create
    @user = User.new(user_params)
  end

  def show
    @schedules = @user.schedules
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params[:user].permit(:email, :password, :role, :schedule_ids=>[])
  end

end
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
    if @user.save
      flash[:notice] = "User was created"
      redirect_to(users_path)
    else
      flash[:alert] = "There was an error"
      render 'new'
    end
  end

  def show
    @viewings = @user.viewings
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "User was updated"
      redirect_to(users_path)
    else
      flash[:alert] = "There was an error"
      render 'new'
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User removed"
    redirect_to(root_path)
  end
  

  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params[:user].permit(:email, :password, :role, :schedule_ids=>[])
  end

end
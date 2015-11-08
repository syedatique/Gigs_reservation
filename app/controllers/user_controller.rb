class UsersController < ApplicationController

  load_and_authorize_resource

  def index
    @users = User.all
  end

  def new
    @user = User.new
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
    @user = User.find(params[:id])
    @viewings = @user.viewings
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User was updated"
      redirect_to(users_path)
    else
      flash[:alert] = "There was an error"
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User removed"
    redirect_to(root_path)
  end
  
  private
  def user_params
    params[:user].permit(:email, :password)
  end

end
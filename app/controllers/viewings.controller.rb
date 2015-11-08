class ViewingsController < ApplicationController

  load_and_authorize_resource except: :create

  def new
    @viewing = Viewing.new(user: current_user)
  end

  def create
    @viewing = Viewing.new(gig_id: viewing_params[:gig_id][:gig_id], user: current_user)
    authorize! @viewing, current_user
    if @viewing.save
      flash[:notice] = "Viewing was created"
      redirect_to(user_path(@viewing.user.id))
    else
      flash[:alert] = "There was an error"
      render 'new'
    end
  end

private
def viewing_params
  params[:viewing].permit({gig_id: :gig_id}, {user_id: :user_id})
end


end
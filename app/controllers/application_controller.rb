class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def after_sign_in_path_for(resource)
    # gigs_path
    gigs_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "You can't access this page"
  end
end

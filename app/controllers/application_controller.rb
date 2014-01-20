class ApplicationController < ActionController::Base
  helper_method :require_signin!, :current_user

  protect_from_forgery with: :exception

  private

  def authorize_admin!
    require_signin!

    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end

  def require_signin!
    if current_user.nil?
      flash[:error] = "You need to sign in or sign up before continuing."
      redirect_to signin_url
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
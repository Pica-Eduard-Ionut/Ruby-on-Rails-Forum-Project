class ApplicationController < ActionController::Base
  before_action :require_login, except: [:new, :create]

  private

  def require_login
    redirect_to root_path unless logged_in?
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end

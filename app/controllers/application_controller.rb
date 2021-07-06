class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def current_user
    if session[:user_id]
     @current_user ||= User.find_by(id: session[:user_id]) #@current_user = @current_user || User.find_by(id: session[:user_id])と同じ意味
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
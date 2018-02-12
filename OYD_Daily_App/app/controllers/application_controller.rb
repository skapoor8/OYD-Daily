class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  

  def hello
  	render html: "Menu here...Event Tracker...Video Archive..."
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
		unless current_user
			redirect_to log_in_path
		end
	end


end

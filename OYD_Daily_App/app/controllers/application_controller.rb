class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
  	render html: "Menu here...Event Tracker...Video Archive..."
  end
end

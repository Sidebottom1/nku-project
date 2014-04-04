class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  
  def current_baker
    @current_baker ||= Baker.find(session[:baker_id]) if session[:baker_id]
  end
  helper_method :current_baker
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?

    private
  
    def logged_in?
      !!session[:client_id]
    end
  
    def current_user
      @current_user ||= Client.find_by_id(session[:client_id]) if session[:client_id]
    end
  
    def redirect_if_not_logged_in
      redirect_to login_path if !logged_in?
    end

    def redirect_if_logged_in
      if current_user
        flash[:message] = "You Cannot access the page you wanted while Logged in"
        redirect_to reservations_path
      end
    end
end

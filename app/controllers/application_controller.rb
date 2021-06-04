class ApplicationController < ActionController::Base
    helper_method :current_user
    
    def current_user
        @current_user ||= Client.find_by_id(session[:client_id]) if session[:client_id]
    end
end

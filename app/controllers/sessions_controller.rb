class SessionsController < ApplicationController

    def welcome
    end

    def destroy
        reset_session
        redirect_to '/'
    end

end
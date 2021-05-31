class SessionsController < ApplicationController

    def welcome
    end

    def new
        @client = Client.new
    end

    def create
        @client = Client.find_by(username: params[:client][:username])
        if @client && @client.authenticate(params[:client][:password])
            session[:client_id] = @client.id
            redirect_to client_path(@client)
        else
            render :new
        end
    end

    def destroy
        reset_session
        redirect_to '/'
    end

end
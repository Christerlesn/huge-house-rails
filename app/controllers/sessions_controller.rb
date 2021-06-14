class SessionsController < ApplicationController

    def welcome
        redirect_if_logged_in
    end

    def new
        redirect_if_logged_in
        @client = Client.new
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
            @client = Client.find_or_create_by_omniauth(auth_hash)
            session[:client_id] = @client.id

            flash[:message] = "Welcome #{@client.username}"
            redirect_to reservations_path
        else
            @client = Client.find_by(username: params[:client][:username])
            if @client && @client.authenticate(params[:client][:password])
                session[:client_id] = @client.id
                flash[:message] = "Welcome #{@client.username}"
                redirect_to reservations_path
            else
                flash[:error] = "The Username or Password is Incorrect, or doesn't exist"
                render :new
            end
        end
    end

    def destroy
        reset_session
        redirect_to '/'
    end
    
    private
    
    def auth
        request.env['omniauth.auth']
    end

end
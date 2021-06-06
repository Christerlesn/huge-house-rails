class SessionsController < ApplicationController

    def welcome
    end

    def new
        @client = Client.new
    end

    def create
        if params[:provider] == 'github'
            @client = Client.create_by_github_omniauth(auth)
            session[:client_id] = @client.id
            redirect_to client_path(@client)
        else
            @client = Client.find_by(username: params[:client][:username])
            if @client && @client.authenticate(params[:client][:password])
                session[:client_id] = @client.id
                flash[:message] = "Welcome #{@client.first_name}"
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

    def omniauth
        @client = Client.create_by_github_omniauth(auth)
    
        session[:client_id] = @client.id
        redirect_to client_path(@client)
    end
    
    private
    
    def auth
        request.env['omniauth.auth']
    end

end
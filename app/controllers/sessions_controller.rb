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
            # raise auth_hash.inspect
            oauth_username = request.env['omniauth.auth']['info']['nickname']
            if @client = Client.find_by(:username => oauth_username)
                session[:client_id] = @client.id

                flash[:message] = "Welcome #{@client.username}"
                redirect_to reservations_path
            else
                @client = Client.new(:username => oauth_username, :first_name => request.env['omniauth.auth']['info']['name'], :password => SecureRandom.hex, :email => request.env['omniauth.auth']['info']['urls']['GitHub'])
                if @client.save
                    session[:client_id] = @client.id

                    flash[:message] = "Welcome #{@client.username}"
                    redirect_to reservations_path
                else
                    raise @client.errors.full_messages.inspect
                end
            end
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
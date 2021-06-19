class ClientsController < ApplicationController

    def new
        redirect_if_logged_in
        @client = Client.new
    end

    def create
        @client = Client.new(client_params)
        if @client.save
            session[:client_id] = @client.id
            flash[:message] = "Welcome #{@client.first_name}"
            redirect_to reservations_path
        else
            render :new
        end
    end

    def most_active
        @client = Client.most_active_client
        raise params.inspect
    end

    private

    def client_params
        params.require(:client).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
    end
end

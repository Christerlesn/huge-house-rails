class ClientsController < ApplicationController

    def new
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

    def show
        @client = Client.find_by_id(params[:id])
         redirect_to '/' if !@client
    end

    private

    def client_params
        params.require(:client).permit(:username, :first_name, :last_name, :email, :password, :password_confirmation)
    end
end

class ClientsController < ApplicationController

    def new
        @client = Client.new
    end

    def create
        @client = Client.new(client_params)
        if @client.save
            session[:client_id] = @client.id
            redirect_to client_path(@client)
        else
            flash[:error] = "Please fix the error(s) before saving"
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

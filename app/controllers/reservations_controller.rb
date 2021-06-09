class ReservationsController < ApplicationController
    before_action :redirect_if_not_logged_in
    def new
        @reservation = Reservation.new
        @reservation.build_event
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.client_id = session[:client_id]
        if @reservation.save
            redirect_to reservation_path(@reservation)
        else
            @reservation.build_event
            render :new
        end
    end

    def show
        @reservation = Reservation.find_by_id(params[:id])
    end

    def index
        if @client = Client.find_by_id(params[:client_id])
            @reservations = @client.reservations.order_by_start_time
            #nested
        else
            @reservations = Reservation.all.order_by_start_time.includes(:event)
        end
    end

    def destroy
        @reservation = Reservation.find_by_id(params[:id])
        if @reservation.client_id == session[:client_id]
            # raise params.inspect
            @reservation.event.vendors.destroy_all
            @reservation.event.destroy
            @reservation.destroy
        else
            flash[:message] = "Unable to Delete Others Reservation."
        end
        # raise params.inspect
        redirect_to reservations_path
    end

    private

    def reservation_params
        params.require(:reservation).permit(:start_time, :end_time, :client_id, :event_id, event_attributes:[:title, :description])
    end
end

class ReservationsController < ApplicationController

    def new
        @reservation = Reservation.new
        @reservation.build_event
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.client_id = session[:client_id]
        if @reservation.save
            # redirect_to reservation_path(@reservation)
            redirect_to reservations_path
        else
            render :new
        end
    end

    def show
        @reservation = Reservation.find_by_id(params[:id])
    end

    def index
        @reservations = Reservation.all
    end

    private

    def reservation_params
        params.require(:reservation).permit(:start_time, :end_time, :client_id, :event_id, event_attributes:[:title, :description])
    end
end

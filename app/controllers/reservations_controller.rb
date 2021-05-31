class ReservationsController < ApplicationController

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
            flash[:error] = "Something is wrong with this Reservation. Please fix it before we continue."
            render :new
        end
    end

    private
    def reservation_params
        params.require(:reservation).permit(:start_time, :end_time, :client_id, :event_id, client_attributes: [:username])
    end
end

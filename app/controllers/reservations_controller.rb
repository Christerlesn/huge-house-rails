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

    def edit
        @reservation = Reservation.find_by_id(params[:id])
        if @reservation.client_id == session[:client_id]
            render :edit
        else
            flash[:notice] = "You cannot edit this reservation"
            redirect_to reservations_path
        end
    end

    def update
        @reservation = Reservation.find_by_id(params[:id])
        if @reservation.update(reservation_params)
            redirect_to reservation_path(@reservation)
        else
            render :edit
        end
    end

    def show
        @reservation = Reservation.find_by_id(params[:id])
    end

    def index
        if @client = Client.find_by_id(params[:client_id])
            if @client.id == session[:client_id]
                #nested
                @reservations = @client.reservations.order_by_start_time
            else
                flash[:notice] = "You cannot access another user's information"
                redirect_to reservations_path
            end
        else
            @reservations = Reservation.all.order_by_start_time.includes(:event)
        end
    end

    def destroy
        @reservation = Reservation.find_by_id(params[:id])
        if @reservation.client_id == session[:client_id]
            @reservation.destroy
        else
            flash[:message] = "Unable to Delete Others Reservations."
        end
        redirect_to reservations_path
    end

    private

    def reservation_params
        params.require(:reservation).permit(:start_time, :end_time, :client_id, :event_id, event_attributes:[:title, :description])
    end
end

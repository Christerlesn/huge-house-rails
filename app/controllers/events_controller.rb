class EventsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @event = Event.new
        @event.reservations.build
    end

    def create
        @event = Event.new(event_params)
        # @event.reservations.client_id = session[:client_id]
        raise params.inspect
        if @event.save
            raise params.inspect
            redirect_to event_path(@event)
        else
            @event.vendors.build
            render :new
        end
    end

    def show
        @event = Event.find_by_id(params[:id])
    end


    def index
        @events = Event.all
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, reservations_attributes: [:start_time, :end_time, :client_id, :event_id])
    end
end

class EventsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to event_path(@event)
        else
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
        params.require(:event).permit(:title, :description)
    end
end

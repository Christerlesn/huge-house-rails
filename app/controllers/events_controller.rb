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

    def edit
        @event = Event.find_by_id(params[:id])
    end

    def update
        @event = Event.find_by_id(params[:id])
        if @event.update(event_params)
            redirect_to event_path(@event)
        else
            render :edit
        end
    end

    def destroy
        @event = Event.find_by_id(params[:id])
        # raise params.inspect
        # if @event.reservations.client_id == session[:client_id]
            @event.destroy
        # else
        #     flash[:message] = "Unable to Delete Others Events."
        # end
        redirect_to events_path
    end

    private

    def event_params
        params.require(:event).permit(:title, :description)
    end
end

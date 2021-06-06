class EventsController < ApplicationController
    before_action :redirect_if_not_logged_in
    def index
        @events = Event.all
    end
end

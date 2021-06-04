class VendorsController < ApplicationController

    def new
        @event = Event.find_by_id(params[:event_id])
        @vendor = @event.vendors.build
    end

    def create
        @vendor = Vendor.new(vendor_params)
        if @vendor.save
            redirect_to vendor_path(@vendor)
        else
            render :new
        end
    end

    def show    
    end

    def index

    end
    private

    def vendor_params
        params.require(:vendor).permit(:name, :type, :description, :event_id) #, event_attributes:[:title, :description])
    end
end

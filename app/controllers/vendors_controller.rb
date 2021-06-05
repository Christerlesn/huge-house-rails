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
        @event = Event.find_by_id(params[:event_id])
        @vendor = Vendor.find_by_id(params[:id])
    end

    def index

    end
    
    private

    def vendor_params
        params.require(:vendor).permit(:name, :vendor_type, :description, :event_id)
    end
end

class VendorsController < ApplicationController

    def new
        @vendor = Vendor.new(event_id: params[:event_id])
        # if @event = Event.find_by_id(params[:event_id])
        #     @vendor = @event.vendors.build
        # else
        #     @vendor = Vendor.new
        # end
    end

    def create
        @vendor = Vendor.new(vendor_params)
        @vendor.save
        redirect_to vendor_path(@vendor)
    end

    def index
    end

    def show    
    end

    private

    def vendor_params
        params.require(:vendor).permit(:name, :type, :description, :event_id) #, event_attributes:[:title, :description])
    end
end

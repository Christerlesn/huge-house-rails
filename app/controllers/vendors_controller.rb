class VendorsController < ApplicationController

    def new
        if @event = Event.find_by_id(params[:event_id])
            @vendor = @event.vendors.build
        else
            @vendor = Vendor.new(vendor_params)
        end
    end

    def create

    end

    private

    def vendor_params
        params.require(:vendor).permit(:name, :type, :description, :event_id, event_attributes:[:title, :description])
    end
end

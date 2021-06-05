class VendorsController < ApplicationController

    def new
        if @event = Event.find_by_id(params[:event_id])
            @vendor = @event.vendors.build
        else
            @vendor = Vendor.new
        end
    end

    def create
        @event = Event.find_by_id(params[:id])
        @event.vendors = Vendor.new
        @vendor = @event.vendors.build(vendor_params)
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
        if @event = Event.find_by_id(params[:event_id])
            @vendors = @event.vendors
        else
            @vendors = Vendor.all
        end
    end
    
    private

    def vendor_params
        params.require(:vendor).permit(:name, :vendor_type, :description, :event_id)
    end
end

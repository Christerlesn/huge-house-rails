class VendorsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @event = Event.find_by_id(params[:event_id])
        if @event.reservations.first.client_id == session[:client_id]
            @vendor = @event.vendors.build
        else
            flash[:message] = "You cannot create a vendor for this event."
            redirect_to reservations_path
        end
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
        if  @event = Event.find_by_id(params[:event_id])
            #nested
            @vendors = @event.vendors
        else
            @vendors = Vendor.all
        end
    end

    def destroy
        @vendor = Vendor.find_by_id(params[:id])
        # raise params.inspect
        if @vendor.event.reservations.first.client_id == session[:client_id]
            @vendor.destroy
        else
            flash[:message] = "Unable to Delete Others Vendors."
        end
        redirect_to reservations_path
    end
    
    private

    def vendor_params
        params.require(:vendor).permit(:name, :vendor_type, :description, :event_id)
    end
end

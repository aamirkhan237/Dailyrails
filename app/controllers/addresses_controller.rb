class AddressesController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @address = current_user.addresses.new
    end
  
    def create
      @address = current_user.addresses.new(address_params)
      
      if @address.save
        flash[:notice] = "Address added successfully."
        if params[:product_id].present?
          redirect_to new_order_path(product_id: params[:product_id])
        else
          redirect_to new_order_path
        end
      else
        render 'new'
      end
    end
  
    private
  
    def address_params
      params.require(:address).permit(:name, :street, :city, :state, :zip, :country)
    end
  end
  
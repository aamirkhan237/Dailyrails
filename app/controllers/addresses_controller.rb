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
      @order = Order.new
      @product = Product.find(params[:product_id]) if params[:product_id].present?

      if @product.present?
        @order.order_items.build(product: @product, quantity: 1)
      else
        @cart = current_user.cart
        @cart.cart_items.each do |cart_item|
          @order.order_items.build(product: cart_item.product, quantity: cart_item.quantity)
        end
      end

      @addresses = current_user.addresses
      render 'orders/new'
    end
  end

  def states
    country = params[:country]
    states = CS.states(country)
    logger.debug "States: #{states.inspect}" 
    render json: { states: states }
  end

  def cities
    country = params[:country]
    state_code = params[:state] 
    cities = CS.cities(state_code, country)
    logger.debug "Cities: #{cities.inspect}" 
    render json: { cities: cities }
  end


  private

  def address_params
    params.require(:address).permit(:name, :street, :city, :state, :country, :zip,:country_full, :state_full)
  end

#   def address_params_with_full_names
#     params_with_full_names = address_params.dup
#     params_with_full_names[:country] = params_with_full_names.delete(:country_full) if params_with_full_names[:country_full].present?
#     params_with_full_names[:state] = params_with_full_names.delete(:state_full) if params_with_full_names[:state_full].present?
#     params_with_full_names
#   end

#   def address_params_with_full_names
#     params_with_full_names = address_params.dup
#     # params_with_full_names[:country_full] ||= params_with_full_names[:country] if params_with_full_names[:country].present?
#     # params_with_full_names[:state_full] ||= params_with_full_names[:state] if params_with_full_names[:state].present?
#     params_with_full_names
#   end
end

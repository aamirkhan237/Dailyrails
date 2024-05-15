class OrdersController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @order = Order.new
      @product = Product.find(params[:product_id]) if params[:product_id].present?

      puts "@product assigned:", @product.inspect
      @order.order_items.build(product: @product, quantity: 1) if @product.present?

      @addresses = current_user.addresses
      @address = Address.new 
    end
  
    def create
      @order = Order.new(order_params)
      @order.user = current_user
      @order.address = current_user.addresses.find(params[:order][:address_id])

      if @order.save
        flash[:notice] = "Your order has been placed successfully!"
        redirect_to orders_path
      else
        render 'new'
      end
    end

    private
  
    def order_params
      params.require(:order).permit(:address_id, order_items_attributes: [:product_id, :quantity])
    end
  end
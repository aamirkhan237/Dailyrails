class OrdersController < ApplicationController
    before_action :authenticate_user!
    protect_from_forgery with: :exception, unless: -> { request.format.json? }
  
    def new
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
      @address = Address.new
    end
  
    def create
        Rails.logger.debug "OrdersController#create called"
        @order = current_user.orders.build(order_params)

        if params[:product_id].present?
            product = Product.find(params[:product_id])
            @order.order_items.build(product: product, quantity: 1)
          else
            @cart = current_user.cart
            @cart.cart_items.each do |cart_item| 
              @order.order_items.build(product: cart_item.product, quantity: cart_item.quantity)
            end
          end
        @order.total_price = @order.order_items.sum { |item| item.product.price * item.quantity }

            if @order.save
            Rails.logger.debug "Order saved successfully"
            @cart.cart_items.destroy_all if @cart.present? # Clear the cart after the order is placed
            redirect_to confirmation_order_path(@order)
            else
            Rails.logger.debug "Order save failed: #{@order.errors.full_messages}"
            @addresses = current_user.addresses
            render :new
            end
    end
  
    def confirmation
        @order = Order.find(params[:id])
      end
      
    private
  
    def order_params
      params.require(:order).permit(:address_id,:total_price, order_items_attributes: [:product_id, :quantity])
    end
    def address_params
        params.require(:order).permit(:name, :street, :city, :state, :zip)
      end
  end

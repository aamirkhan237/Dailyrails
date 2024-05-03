class CartItemsController < ApplicationController
  before_action :authenticate_user!

  
    def create
      @cart = current_user.cart || current_user.create_cart
      @cart_item = @cart.cart_items.find_or_initialize_by(product_id: params[:product_id])
      @cart_item.quantity ||= 0
      @cart_item.quantity += 1
      @cart_item.save
    redirect_to products_path, notice: 'Product added to cart.'
  end
  def update
    @cart_item = current_user.cart.cart_items.find(params[:id])
    @cart_item.update(quantity: params[:quantity])
    redirect_to cart_path, notice: 'Quantity updated.'
  end
  def destroy
    @cart_item = current_user.cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path, notice: 'Product removed from cart.'
  end

end
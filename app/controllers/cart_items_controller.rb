class CartItemsController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def create
    @cart = current_user.cart || current_user.create_cart
    @cart_item = @cart.cart_items.find_or_initialize_by(product_id: params[:product_id])
    @cart_item.quantity ||= 0
    @cart_item.quantity += 1
    if @cart_item.save
      redirect_to products_path, notice: 'Product added to cart.'
    else
      redirect_to products_path, alert: 'Failed to add product to cart.'
    end
  end

  def update
    @cart_item = current_user.cart.cart_items.find(params[:id])
    if @cart_item.update(quantity: params[:quantity])
      redirect_to cart_path, notice: 'Quantity updated.'
    else
      redirect_to cart_path, alert: 'Failed to update quantity.'
    end
  end

  def destroy
    @cart_item = current_user.cart.cart_items.find(params[:id])
    if @cart_item.destroy
      redirect_to cart_path, notice: 'Product removed from cart.'
    else
      redirect_to cart_path, alert: 'Failed to remove product from cart.'
    end
  end

  private

  def record_not_found
    redirect_to cart_path, alert: 'Record not found.'
  end
end

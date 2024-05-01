class CartController < ApplicationController
  def show
    @render_cart = false
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
  
    if current_orderable && quantity > 0
      current_orderable.update(quantity: quantity)
    elsif current_orderable && quantity <= 0
      current_orderable.destroy
    elsif quantity > 0
      @cart.orderables.create(product: @product, quantity: quantity)
    end
  
    respond_to do |format|
      format.html { redirect_to product_path(@product)}
    end
  end

  def remove
    orderable = Orderable.find_by(id: params[:id])
    orderable.destroy if orderable
  
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
    end
  end
  
end
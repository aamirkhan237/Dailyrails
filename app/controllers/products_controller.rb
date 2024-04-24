class ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_vendor, only: [:new, :create, :edit, :update, :destroy]
  
    def index
      @products = Product.all
    end
  
    def show
      @product = Product.find(params[:id])
    end
  
    def new
      @product = Product.new
    end
  
    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @product = Product.find(params[:id])
    end
  
    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to products_url, notice: 'Product was successfully destroyed.'
    end
  
    private
  
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
  
    def authorize_vendor
      redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user.vendor?
    end
  end
  
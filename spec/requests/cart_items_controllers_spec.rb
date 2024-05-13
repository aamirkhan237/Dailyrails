require 'rails_helper'

RSpec.describe "CartItemsControllers", type: :request do
  let!(:user) { create(:user) }

  describe "POST #create" do
    context "with valid params" do
      let!(:product) { create(:product) }

      before do
        sign_in(user)
      end

      it "creates a new cart item for the logged-in user" do
        post cart_cart_items_path, params: { product_id: product.id }
        expect(response).to redirect_to(products_path)
        expect(flash[:notice]).to eq('Product added to cart.')
        expect(CartItem.count).to eq(1)
        expect(CartItem.first.cart.user).to eq(user)
        expect(CartItem.first.product).to eq(product)
      end
    end

    describe "PATCH /cart/cart_items/:id" do
      let(:user) { create(:user) }
      let(:cart) { create(:cart, user:user)}
      let(:cart_item) { create(:cart_item, cart:cart) }
  
      before { sign_in user }
  
      it "updates the quantity of a cart item" do
        patch cart_cart_item_path(cart_item), params: { quantity: 2}
        expect(response).to redirect_to(cart_path)
        expect(flash[:notice]).to eq('Quantity updated.')
        expect(cart_item.reload.quantity).to eq(2)
      end
    end
    
    describe "DELETE /cart/cart_items/:id" do
      let(:user) { create(:user) }
      let(:cart) { create(:cart, user:user)}
      let(:cart_item) { create(:cart_item, cart:cart) }
  
      before { sign_in user } 
      it "removes a product from the cart" do
        delete cart_cart_item_path(cart_item)
        expect(response).to redirect_to(cart_path)
        expect(flash[:notice]).to eq('Product removed from cart.')
        expect { cart_item.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
end
end
require 'rails_helper'

RSpec.describe CartsController, type: :request do
  describe "GET /cart" do
    let(:user) { create(:user) } 
    context "when the user has a cart" do 
      let!(:cart) { create(:cart, user: user) } # Create the cart here

      it "shows the user's cart" do
        sign_in user
        get cart_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
        expect(assigns(:cart)).to eq(cart)
        debugger
      end
    end
    context "when the user doesn't have a cart" do
      it "creates a new cart for the user" do
        sign_in user
        get cart_path
        expect(response).to have_http_status(:success)
        expect(response).to render_template(:show)
        expect(assigns(:cart)).to be_a(Cart)
        expect(assigns(:cart)).to be_persisted
        expect(assigns(:cart).user).to eq(user)
        debugger
      end
    end
  end
end

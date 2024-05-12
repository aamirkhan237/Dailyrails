require 'rails_helper'

RSpec.describe "ProductsControllers", type: :request do
  let(:user) { create(:user) }
  before do
     sign_in user

  end
#index -------
  describe "GET /products" do
    let(:product) { create(:product)}
    it "returns http success" do
      get products_path
      expect(response).to have_http_status(:success)
    end
    it "renders the index template" do
      get products_path
      expect(response).to render_template(:index)
      # debugger
    end
  end

  describe "GET /products/:id" do
    let(:product) { create(:product)}
      it "returns http success" do
          get product_path(product)
          expect(response).to have_http_status(:success)
        end
      
        it "renders the show template" do
          get product_path(product)
          expect(response).to render_template(:show)
          # debugger
        end
    end
#new ---vendor*******
    describe "GET /products/new" do
      it "returns http success for vendor" do
        vendor = create(:user, :vendor) # Use the :vendor trait to create a vendor user
        sign_in vendor
        get new_product_path
        expect(response).to have_http_status(:success)
      end
      
      it "redirects for non-vendor" do
        user = create(:user) # Create a regular user
        sign_in user
        get new_product_path
        expect(response).to have_http_status(302) # Redirect for non-vendor users
      end

      it "renders the new template" do
        vendor = create(:user, :vendor) 
        sign_in vendor 
        get new_product_path
        expect(response).to render_template(:new)
      end
    end
#edit ---vendor
      describe "GET /products/:id/edit" do
        let(:product) { create(:product)}
        it "returns http success" do
          vendor = create(:user, :vendor) 
          sign_in vendor 
          get edit_product_path(product)
          expect(response).to have_http_status(:success)
        end

        it "renders the edit template" do
          vendor = create(:user, :vendor) 
          sign_in vendor 
          get edit_product_path(product)
          expect(response).to render_template(:edit)
        end
      end

#create
describe "POST /products" do
  let(:valid_product_attributes) { attributes_for(:product) }
  let(:product) { create(:product) }
  it "creates a new product" do
    vendor = create(:user, :vendor)
    sign_in vendor 
    post products_path, params: { product: valid_product_attributes }
    expect(response).to have_http_status(:found) # Redirect (302)
    expect(Product.last.name).to eq(valid_product_attributes[:name])
    expect(response).to redirect_to(product_path(Product.last))
    # debugger
  end
  
  it "creates a new product  without valid attributes" do
    # vendor = create(:user, :vendor)
    # sign_in vendor 
    post products_path, params: { product: product.attributes }
    expect(response).to have_http_status(:found) # Redirect (302)
    expect(Product.last.name).to eq(product.name)
    # debugger
  end
end

#patch

describe "PATCH /products/:id" do
  let(:vendor) { create(:user, :vendor) }
  let!(:product) { create(:product) }
  let(:updated_attributes) { { name: "Updated Product Name" } }

  it "updates a product when a vendor is signed in" do
    sign_in vendor
    debugger
    patch product_path(product), params: { product: updated_attributes }
    expect(response).to have_http_status(:found) # Redirect (302)
    product.reload
    expect(product.name).to eq(updated_attributes[:name])
    expect(response).to redirect_to(product_path(product))
    # debugger
  end
end
#delete vendor --------
describe "DELETE /products/:id" do
  let(:vendor) { create(:user, :vendor) }
  let!(:product) { create(:product) }

  it "destroys a product when a vendor is signed in" do
    sign_in vendor
    expect { delete product_path(product) }.to change(Product, :count).by(-1)
    expect(response).to have_http_status(:found) # Redirect (302)
    expect(response).to redirect_to(products_path)
    debugger
  end
end

end
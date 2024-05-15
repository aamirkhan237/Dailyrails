require 'rails_helper'


RSpec.describe CartItem, type: :model do
    context 'associations' do
      it { should belong_to(:cart) }
      it { should belong_to(:product) }
    end

    context 'validations' do
      it 'validates presence of cart_item' do
        cart_item = create(:cart_item)
        expect(cart_item).to be_valid
        # debugger
      end
    end
    context 'validations' do
      it 'validates presence of cart' do
        cart_item = build(:cart_item, cart: nil)
        expect(cart_item).not_to be_valid
        # debugger
      end
  
      it 'validates presence of product' do
        cart_item = build(:cart_item, product: nil)
        expect(cart_item).not_to be_valid
        # debugger
      end


      it 'can be created and associated with a new cart and product' do
        user = create(:user)
        cart = create(:cart, user:user)
        product = create(:product)
        cart_item = create(:cart_item,cart: cart, product: product) #I have removed the method of activerecord CartItem.create
        expect(cart_item).to be_valid
        expect(cart_item.cart).to eq(cart)
        expect(cart_item.product).to eq(product)
        # debugger
      end
  end
end
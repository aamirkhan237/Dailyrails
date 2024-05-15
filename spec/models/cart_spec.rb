require 'rails_helper'

  RSpec.describe Cart, type: :model do
  describe "Cart" do
    it { should belong_to(:user)}
    it { should have_many(:cart_items).dependent(:destroy) }
  end

  describe 'validations' do
    it 'validates presence of user' do
      cart = create(:cart)
      expect(cart).to be_valid
      # debugger
    end
    it 'validates presence of user' do
        cart = build(:cart,user: nil)
        expect(cart).not_to be_valid
        # debugger
      end
    end
  describe 'behavior' do
    it 'can be created and associated with a user' do
      user=create(:user)
      cart = create(:cart,user:user) #I have removed the method of activerecord CartItem.create
      expect(cart).to be_valid
      expect(cart.user).to eq(user)
      # debugger
    end
end
end
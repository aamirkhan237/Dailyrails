require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
  describe "POST /users/:id/follow" do
    let(:user) { create(:user) }
    let(:user1) { create(:user) }

    it "follows another user" do
      sign_in user
      post follow_user_path(user1)
      expect(response).to redirect_to(root_path)
      expect(user.following?(user1)).to be_truthy
    end

    it "redirects to sign in when user is not signed in" do
      post follow_user_path(user1) 
      expect(response).to redirect_to(new_user_session_path)
    end
  end
  
  describe "POST /users/:id/unfollow" do
    let(:user) { create(:user) }
    let(:user1) { create(:user) }
    
    before do
      post follow_user_path(user1)
    end

    it "unfollows another user" do
      sign_in user
      post unfollow_user_path(user1)
      # expect {
      #   post unfollow_user_path(user1)
      # }.to change { user.following?(user1) }.from(true).to(false)

      expect(response).to redirect_to(root_path)
      expect(user.following?(user1)).to be_falsy
    end

    it "redirects to sign in when user is not signed in" do
      post unfollow_user_path(user1)
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end

require 'rails_helper'

RSpec.describe "UsersControllers", type: :request do
  describe "GET /users/:id" do
    before do
      @user = create(:user) 
      get user_path(@user) 
    end
  
    it "returns http success" do
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end
end

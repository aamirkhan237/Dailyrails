class UsersController < ApplicationController
    before_action :authenticate_user! , only: [:follow, :unfollow]
    before_action :set_user
    def show; end
    def follow
        @user=User.find(params[:id])
        current_user.send_follow_request_to(@user)
        @user.accept_follow_request_of(current_user)
        redirect_to root_path, notice: "You are now following #{@user.email}"
    end
  
    def unfollow
        user = User.find(params[:id])
        current_user.unfollow(user)
        redirect_to root_path , notice: "You have unfollowed #{user.email}."
    end
      private      
    def set_user
        @user = User.find(params[:id])
    end
    
end 

class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:follow, :unfollow]

    def follow
      @user = User.find(params[:id])
      current_user.send_follow_request_to(@user)
      redirect_to root_path, notice: "You are now following #{@user.email}"
    end
  
    def unfollow
      @user = User.find(params[:id])
      current_user.unfollow(@user)
      redirect_to root_path, notice: "You have unfollowed #{@user.email}"
    end
    def accept_follow_request
        @user = User.find(params[:id])
        current_user.accept_follow_request_of(@user)
        redirect_to root_path, notice: "You have accepted the follow request from #{@user.email}"
      end
    
      def decline_follow_request
        @user = User.find(params[:id])
        current_user.decline_follow_request_of(@user)
        redirect_to root_path, notice: "You have declined the follow request from #{@user.email}"
      end
      private
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
        end
    
end 

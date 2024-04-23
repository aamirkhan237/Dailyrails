# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end
  def omniauth(provider)
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: provider.capitalize
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: provider.capitalize, reason: "#{auth.info.email} is not authorized."
      redirect_to new_user_session_path
    end
  end
  
  def google_oauth2
    omniauth(:google_oauth2)
  end
  
  def facebook
    omniauth(:facebook)
  end

 
  private
  def auth
    @auth ||=request.env['omniauth.auth']
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:google_oauth2,:facebook]
         enum role: [:user, :vendor]
         validates :first_name, :last_name, :mobile_number, :location, :date_of_birth, presence: true, unless: :omniauth_sign_in?
        

         def self.from_omniauth(auth)
          name_split = auth.info.name.split(" ")
          user = User.where(email: auth.info.email).first
          user ||= User.create!(provider: auth.provider, uid: auth.uid, last_name: name_split[0], first_name: name_split[1], email: auth.info.email, password: Devise.friendly_token[0, 20])
          user
        end
        def omniauth_sign_in?
          provider.present? # Check if the user is signing in via OmniAuth
        end
        def self.ransackable_attributes(auth_object = nil)
          ["avatar_url", "created_at", "date_of_birth", "email", "encrypted_password", "first_name", "full_name", "id", "id_value", "last_name", "location", "mobile_number", "provider", "remember_created_at", "reset_password_sent_at", "reset_password_token", "role", "uid", "updated_at"]
        end
        
end 
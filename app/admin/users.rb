ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :email, :password, :password_confirmation
  permit_params :email, :full_name, :first_name, :last_name, :mobile_number, :location, :date_of_birth

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :mobile_number
    column :location
    column :date_of_birth
    column :provider
    actions
  end

  filter :email
  filter :provider
  filter :location
  filter :first_name
  
  
  # Uncomment all parameters which should be permitted for assignment
  #
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :full_name, :uid, :avatar_url, :provider, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :mobile_number, :location, :date_of_birth]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end

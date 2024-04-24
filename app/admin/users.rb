ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :email, :password, :password_confirmation
  permit_params :email, :first_name, :last_name,:password,:password_confirmation, :mobile_number, :location, :date_of_birth, :role

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
  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :mobile_number
      f.input :location
      f.input :date_of_birth
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: User.roles.keys
    end
    f.actions
  end
  filter :email
  filter :provider
  filter :location
  filter :first_name
  filter  :role
  
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

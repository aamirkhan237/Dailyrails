ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :price, :image
  #
  # or
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :image 
    actions do |product|
      if product.active?
        link_to 'Set Inactive', set_inactive_admin_product_path(product), method: :put
      else
        link_to 'Set Active', set_active_admin_product_path(product), method: :put
      end
    end
  end

  member_action :set_active, method: :put do
    resource.active!
    redirect_to admin_products_path, notice: "#{resource.name} is now active."
  end

  member_action :set_inactive, method: :put do
    resource.inactive!
    redirect_to admin_products_path, notice: "#{resource.name} is now inactive."
  end

  
  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :status
      f.input :image, as: :file

    end
    f.actions
  end

  # permit_params do
  #   permitted = [:name, :description, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :name
  filter :description  
end
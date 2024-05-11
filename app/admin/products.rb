ActiveAdmin.register Product do

  # Permitting parameters
  permit_params :name, :description, :price, :status, images: []

  # Index view configuration
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :status 
    actions do |product|
      if product.active?
        link_to 'Set Inactive', set_inactive_admin_product_path(product), method: :put
      else
        link_to 'Set Active', set_active_admin_product_path(product), method: :put
      end
    end
  end
  
  # Member actions for setting product active/inactive
  member_action :set_active, method: :put do
    resource.active!
    redirect_to admin_products_path, notice: "#{resource.name} is now active."
  end

  member_action :set_inactive, method: :put do
    resource.inactive!
    redirect_to admin_products_path, notice: "#{resource.name} is now inactive."
  end

  # Show view configuration
  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :price
      row :status 
      row "Images" do
        div do
          product.images.each do |image|
            div do
              image_tag image, size: "200x200"
            end
          end
        end
      end
    end
    active_admin_comments
  end
  
  # Form configuration
  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :price
      f.input :status ,  as: :select
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

  # Filters
  filter :name
  filter :description

end

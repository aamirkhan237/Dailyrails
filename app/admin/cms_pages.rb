ActiveAdmin.register CmsPage do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :slug, :description
  index do
    selectable_column
    id_column
    column :title
    column :slug
    column :description 
    actions
  end
  form do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :description 
    end
    f.actions
  end
  

  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :slug, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  filter :title
  filter :slug
  filter :description
  
end

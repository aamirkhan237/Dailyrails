ActiveAdmin.register CmsPage do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :slug, :description
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

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
      f.input :description 
    end
    f.actions
  end
 filter :title
  filter :slug
  filter :description
end



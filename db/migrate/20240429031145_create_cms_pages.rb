class CreateCmsPages < ActiveRecord::Migration[7.1]
  def change
    create_table :cms_pages do |t|
      t.string :title
      t.string :slug
      t.text :description

      t.timestamps
    end
  end
end

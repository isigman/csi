ActiveAdmin.register Article do

  permit_params :title, :summary, :link, :img, :tag_list

  #Display Articles
  index do
    selectable_column
    id_column
    column :title
    column :summary
    column :link
    column :tag_list
    column :views
  end

  #Form to create Articles
  form do |f|
    f.inputs do
      f.input :title
      f.input :summary, :as => :text
      f.input :link, :as => :url
      f.input :img, :as => :file
      f.input :tag_list, :as => :string
    end
    f.actions
  end

end

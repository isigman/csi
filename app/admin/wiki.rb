ActiveAdmin.register Wiki do
  permit_params :title, :wiki, :resources, :author, :views

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :views
    column :resources
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.file_field :wiki
      f.input :resources
      f.input :author, :input_html => {:value => current_user}
      f.input :views, :input_html => {:value => 0}
    end
    f.actions
  end

end

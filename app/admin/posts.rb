ActiveAdmin.register Post do
  permit_params :title, :body, :user_id

  index do
    selectable_column
    id_column
    column :title
    column :body
    column :updated_at
    column :user
    actions
  end

  filter :title
  filter :body
  filter :user
  filter :images

  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :body
    end
    f.actions
  end
end

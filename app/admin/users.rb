ActiveAdmin.register User do
  permit_params :first_name, :last_name, :personal_data, :password, :email, :birthday

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column :updated_at
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :posts

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :personal_data
      f.input :password
      f.input :email
      f.input :birthday, start_year: Time.now.year - 120, end_year: Time.now.year
    end
    f.actions
  end
end

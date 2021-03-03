ActiveAdmin.register Image do
  permit_params :url, :imageable_type, :imageable_id

  form do |f|
    f.inputs do
      f.input :url
      f.input :imageable_type
      f.input :imageable_id
    end
    f.actions
  end
end

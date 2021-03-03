ActiveAdmin.register Group do
  permit_params :name, :group_type, :status
end

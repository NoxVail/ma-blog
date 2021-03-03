ActiveAdmin.register Membership do
  permit_params :status, :group_id, :user_id
end

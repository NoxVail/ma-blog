class AddMembershipsDefaultStatus < ActiveRecord::Migration[6.1]
  def change
    change_column_default :memberships, :status, from: nil, to: 0
  end
end
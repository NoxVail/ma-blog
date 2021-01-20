class AddGroupsDefaultStatus < ActiveRecord::Migration[6.1]
  def change
    change_column_default :groups, :status, from: nil, to: 0
  end
end

class AddGroupIdToMemberships < ActiveRecord::Migration[6.1]
  def change
    add_column :memberships, :group_id, :integer
  end
end

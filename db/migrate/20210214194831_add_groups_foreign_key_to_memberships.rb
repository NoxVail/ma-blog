class AddGroupsForeignKeyToMemberships < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :memberships, :groups
  end
end

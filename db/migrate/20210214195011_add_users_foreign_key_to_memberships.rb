class AddUsersForeignKeyToMemberships < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :memberships, :users
  end
end

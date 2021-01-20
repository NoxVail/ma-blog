class ChangeUsersPersonalDataType < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :personal_data, :jsonb, using: 'personal_data::jsonb'
  end

  def down
    change_column :users, :personal_data, :string
  end
end

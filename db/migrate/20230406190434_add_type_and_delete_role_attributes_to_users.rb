class AddTypeAndDeleteRoleAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :role
    add_column :users, :type, :string, null: false, default: 'User'
  end
end

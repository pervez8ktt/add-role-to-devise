class AddRoleIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :number
  end
end

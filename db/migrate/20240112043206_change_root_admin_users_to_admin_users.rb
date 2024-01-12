class ChangeRootAdminUsersToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :root_admin_users, :admin_users
  end
end

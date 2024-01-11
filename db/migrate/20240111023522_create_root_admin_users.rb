class CreateRootAdminUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :root_admin_users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :root_admin, default: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end

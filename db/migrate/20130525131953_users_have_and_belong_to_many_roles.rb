class UsersHaveAndBelongToManyRoles < ActiveRecord::Migration
  def change
    create_table :roles_users, id: false do |t|
      t.references :role, :user
    end

    add_index :roles_users, [:role_id, :user_id], unique: true
    add_foreign_key :roles_users, :roles
    add_foreign_key :roles_users, :users
  end
end

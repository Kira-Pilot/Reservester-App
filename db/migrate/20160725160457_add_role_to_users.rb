class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, required: true, default: "regular"
  end
end

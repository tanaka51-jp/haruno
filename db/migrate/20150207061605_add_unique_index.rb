class AddUniqueIndex < ActiveRecord::Migration
  def change
    add_index :organizations, :login_name, unique: true

    add_index :users, [:organization_id, :email], unique: true
  end
end

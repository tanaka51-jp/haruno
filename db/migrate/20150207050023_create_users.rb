class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :family_name, null: false
      t.string :given_name, null: false
      t.string :email, null: false

      t.timestamps null: false
    end
  end
end

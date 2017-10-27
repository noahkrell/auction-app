class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false
      t.string :email, :null => false
      t.string :password_hash, :null => false

      t.timestamps
    end
  add_index :users, :email, :unique => true
  end
end

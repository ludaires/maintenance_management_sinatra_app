class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, unique: true, null: false
      t.string :email, unique: true, null: false
      t.string :password_digest, null: false
    end
  end
end

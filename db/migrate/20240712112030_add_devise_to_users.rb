class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def up
    change_table :users, bulk: true do |t|
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at

      t.index :reset_password_token, unique: true
    end
  end

  def down
    change_table :users, bulk: true do |t|
      t.remove :reset_password_token
      t.remove :reset_password_sent_at
      t.remove :remember_created_at
    end
  end
end

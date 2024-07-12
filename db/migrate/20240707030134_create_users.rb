# db/migrate/YYYYMMDDHHMMSS_create_users.rb
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.datetime :email_verified_at, null: true
      t.string :password_digest
      t.string :remember_token
      t.timestamps
      t.datetime :deleted_at, null: true # 追記: soft delete用のカラム
    end
    add_index :users, :email, unique: true
  end
end

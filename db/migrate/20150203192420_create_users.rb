class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :username, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.string :skill_type, null: false
      t.string :gender, null: false
      t.string :city, null: false
      t.text :about_me
      t.string :experience
      t.string :compensation

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :session_token, unique: true
  end
end

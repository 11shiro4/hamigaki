class CreateKids < ActiveRecord::Migration[8.0]
  def change
    create_table :kids do |t|
      t.string :nickname, null: false
      t.integer :age, null: false
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps
    end

    add_index :kids, :email, unique: true
    add_index :kids, :reset_password_token, unique: true
  end
end
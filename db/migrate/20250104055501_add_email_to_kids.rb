class AddEmailToKids < ActiveRecord::Migration[8.0]
  def change
    add_column :kids, :email, :string
    add_index :kids, :email, unique: true
  end
end

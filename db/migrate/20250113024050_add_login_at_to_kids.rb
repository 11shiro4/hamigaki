class AddLoginAtToKids < ActiveRecord::Migration[8.0]
  def change
    add_column :kids, :login_at, :datetime
  end
end

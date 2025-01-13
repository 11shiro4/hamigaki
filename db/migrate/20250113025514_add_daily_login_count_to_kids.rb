class AddDailyLoginCountToKids < ActiveRecord::Migration[8.0]
  def change
    add_column :kids, :daily_login_count, :integer
  end
end

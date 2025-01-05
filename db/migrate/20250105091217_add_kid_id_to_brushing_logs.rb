class AddKidIdToBrushingLogs < ActiveRecord::Migration[8.0]
  def change
    add_column :brushing_logs, :kid_id, :integer
    add_index :brushing_logs, :kid_id
  end
end

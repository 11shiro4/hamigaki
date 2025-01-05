class AddBrushedAtToBrushingLogs < ActiveRecord::Migration[8.0]
  def change
    add_column :brushing_logs, :brushed_at, :datetime
  end
end

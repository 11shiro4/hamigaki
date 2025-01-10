class AddStatusToBrushingLogs < ActiveRecord::Migration[8.0]
  def change
    add_column :brushing_logs, :status, :string
  end
end

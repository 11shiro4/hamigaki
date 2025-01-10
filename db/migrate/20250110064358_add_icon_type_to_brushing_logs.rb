class AddIconTypeToBrushingLogs < ActiveRecord::Migration[8.0]
  def change
    add_column :brushing_logs, :icon_type, :string
  end
end

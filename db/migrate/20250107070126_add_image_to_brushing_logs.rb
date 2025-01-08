class AddImageToBrushingLogs < ActiveRecord::Migration[8.0]
  def change
    add_column :brushing_logs, :image, :string
  end
end

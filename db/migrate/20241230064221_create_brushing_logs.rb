class CreateBrushingLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :brushing_logs do |t|
      t.string :kid_nickname, null: false
      t.date :date, null: false
      t.integer :time_of_day, null: false

      t.timestamps
    end
  end
end

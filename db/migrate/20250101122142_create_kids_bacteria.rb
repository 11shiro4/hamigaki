class CreateKidsBacteria < ActiveRecord::Migration[8.0]
  def change
    create_table :kids_bacteria do |t|
      t.string :kid_nickname, null: false
      t.string :bacteria_id, null: false
      t.boolean :status, null: false

      t.timestamps
    end
  end
end

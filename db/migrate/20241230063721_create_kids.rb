class CreateKids < ActiveRecord::Migration[8.0]
  def change
    create_table :kids do |t|
      t.string :nickname, null: false
      t.integer :age, null: false

      t.timestamps
    end
  end
end

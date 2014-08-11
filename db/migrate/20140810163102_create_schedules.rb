class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :day
      t.string :time
      t.string :where
      t.text :map
      t.integer :position
      t.integer :category_id

      t.timestamps
    end
  end
end

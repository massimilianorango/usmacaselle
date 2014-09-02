class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :name
      t.string :link
      t.integer :position
      t.integer :category_id

      t.timestamps
    end
  end
end

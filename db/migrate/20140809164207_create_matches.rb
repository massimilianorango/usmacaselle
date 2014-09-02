class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :home
      t.string :guests
      t.string :where
      t.string :day
      t.string :date
      t.string :time
      t.integer :position
      t.integer :calendar_id

      t.timestamps
    end
  end
end

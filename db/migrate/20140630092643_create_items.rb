class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :price
      t.integer :sector_id
      t.integer :priority, null:false

      t.timestamps
    end
    add_index :items, [:sector_id, :created_at]
  end
end
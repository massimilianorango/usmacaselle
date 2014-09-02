class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :image
      t.string :price
      t.integer :position
      t.integer :sector_id

      t.timestamps
    end
    add_index :items, [:sector_id, :created_at]
  end
end
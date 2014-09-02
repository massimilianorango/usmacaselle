class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :image
      t.integer :position
      t.integer :sector_id

      t.timestamps
    end
  end
end

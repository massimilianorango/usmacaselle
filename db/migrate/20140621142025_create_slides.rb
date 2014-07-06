class CreateSlides < ActiveRecord::Migration
    def change
        create_table :slides do |t|
            t.string :image
            t.string :text
            t.string :link
            t.integer :position
            t.integer :sector_id

            t.timestamps
        end
        add_index :slides, [:sector_id, :created_at]
    end
end

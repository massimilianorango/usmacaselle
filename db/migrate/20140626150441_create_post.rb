class CreatePost < ActiveRecord::Migration
    def change
        create_table :posts do |t|
            t.string :title
            t.string :lead_image
            t.text :content
            t.integer :sector_id

            t.timestamps
        end
        add_index :posts, [:sector_id, :created_at]
    end
end
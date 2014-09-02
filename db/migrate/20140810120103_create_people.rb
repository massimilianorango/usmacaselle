class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :image
      t.string :role
      t.string :description
      t.integer :position
      t.integer :category_id

      t.timestamps
    end
  end
end

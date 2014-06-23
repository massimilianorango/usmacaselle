class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :name
      t.string :icon
      t.string :color
      t.string :lead_photo
      t.string :picasa_url
      t.string :email
      t.string :password_digest
      t.boolean :is_root, null:false

      t.timestamps
    end
  end
end

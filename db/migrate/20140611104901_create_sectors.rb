class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :unique_name
      t.string :name
      t.string :lead_photo
      t.string :email
      t.string :password_digest
      t.boolean :is_root, null:false
      t.string :remember_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.string :gallery_url
      t.string :sector_class

      t.timestamps
    end
    add_index  :sectors, :remember_token
  end

end

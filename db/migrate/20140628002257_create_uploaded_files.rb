class CreateUploadedFiles < ActiveRecord::Migration
  def change
    create_table :uploaded_files do |t|
      t.string :attachment
      t.string :att_type
      t.integer :uploaded_by

      t.timestamps
    end
  end
end

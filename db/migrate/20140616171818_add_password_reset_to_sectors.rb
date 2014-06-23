class AddPasswordResetToSectors < ActiveRecord::Migration
  def change
    add_column :sectors, :password_reset_token, :string
    add_column :sectors, :password_reset_sent_at, :datetime
  end
end

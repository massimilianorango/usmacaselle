class AddRememberTokenToSectors < ActiveRecord::Migration
    def change
        add_column :sectors, :remember_token, :string
        add_index  :sectors, :remember_token
    end
end

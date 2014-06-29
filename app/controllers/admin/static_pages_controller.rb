class Admin::StaticPagesController < AuthAdminController
    before_action :correct_sector, only: []
    
    def gallery
    end
end

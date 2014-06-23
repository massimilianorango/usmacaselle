class AuthAdminController < AdminController
    before_action :signed_in_sector
    before_action :correct_sector

    def signed_in_sector
        unless signed_in?
            flash[:warning] = "Devi effettuare l'accesso per poter accedere a quest'area."
            redirect_to admin_url
        else
            @sector = current_sector
        end
    end

    def correct_sector
        @sector = Sector.find(params[:id])
        unless current_sector?(@sector)
            flash[:danger] = "Non puoi modificare le impostazioni di un altro amministratore."
            redirect_to(admin_sector_url(current_sector))
        end
    end
end

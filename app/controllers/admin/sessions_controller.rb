class Admin::SessionsController < AdminController
    def new
        if signed_in?
            redirect_to admin_sector_url(current_sector)
        end
        all_sectors
    end

    def create
        sector = Sector.find_by(id: params[:session][:id])
        if sector && sector.authenticate(params[:session][:password])
            sign_in sector
            redirect_to admin_sector_url(sector)
        else
            flash.now[:danger] = "Password errata. Se non la ricordi usa il modulo di recupero password."
            all_sectors
            render 'new'
        end
    end

    def destroy
        sign_out
        redirect_to root_url
    end

end

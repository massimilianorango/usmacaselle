module Admin::SessionsHelper
    def signed_in?
        !current_sector.nil?
    end

    def current_sector
        remember_token = Sector.digest(cookies[:remember_token])
        @current_sector ||= Sector.find_by(remember_token: remember_token)
    end

    def sign_in(sector)
        remember_token = Sector.new_remember_token
        cookies.permanent[:remember_token] = remember_token
        sector.update_attribute(:remember_token, Sector.digest(remember_token))
        self.current_sector = sector
    end

    def current_sector=(sector)
        @current_sector = sector
    end

    def current_sector?(sector)
        sector == current_sector
    end

    def sign_out
        current_sector.update_attribute(:remember_token, Sector.digest(Sector.new_remember_token))
        cookies.delete(:remember_token)
        self.current_sector = nil
    end

    def all_sectors
        @sectors = Sector.all
        if @sectors.nil?
            flash.now[:danger] = "Non è presente alcun settore. Contatta l'amministratore."
        end
    end
end

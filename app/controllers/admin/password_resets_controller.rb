class Admin::PasswordResetsController < AdminController
    before_action :not_signed_in_sector
    
    def new
        all_sectors
    end

    def create
        sector = Sector.find(params[:sector][:id])
        sector.send_password_reset if sector
        flash[:warning] = "E` stata inviata un'email all'indirizzo " + sector.email + " con le istruzioni per il ripristino della password. Se non la trovi controlla tra lo spam!"
        redirect_to admin_path
    end

    def edit
        @sector = Sector.find_by_password_reset_token!(params[:id])
    end

    def update
        @sector = Sector.find_by_password_reset_token!(params[:id])
        if @sector.password_reset_sent_at.nil? || @sector.password_reset_sent_at < 2.hours.ago
            flash[:danger] = "La richiesta di ripristino è scaduta."
            redirect_to new_admin_password_reset_path
        elsif @sector.update_attributes(params.require(:sector).permit(:password, :password_confirmation))
            @sector.update_attribute('password_reset_sent_at', nil)
            flash[:success] = "La password è stata riprisinata correttamente!"
            redirect_to admin_path
        else
            @sector.errors[:password_confirmation][0] = "Le due password non corrispondono." if @sector.errors.has_key?(:password_confirmation)
            render :edit
        end
    end

    def not_signed_in_sector
        if signed_in?
            flash[:warning] = "Effettua il logout per ripristinare la password."
            redirect_to admin_sector_url(current_sector)
        end
    end
end

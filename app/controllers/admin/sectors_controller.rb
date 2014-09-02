class Admin::SectorsController < AuthAdminController

    def show
        @is_root = current_sector.is_root
    end

    def sector_params(*fields)
        params.require(:sector).permit(*fields)
    end

    def edit
    end

    def update
        if @sector.update_attributes(sector_params(:password_old, :password, :password_confirmation))
            flash[:success] = "Password modificata con successo."
            redirect_to admin_sector_url(@sector)
        else
            @sector.errors[:password_confirmation][0] = "Le due password non corrispondono." if @sector.errors.has_key?(:password_confirmation)
            render 'edit'
        end
    end

end

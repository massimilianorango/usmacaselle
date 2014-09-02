class Admin::StaticPagesController < AuthAdminController
    before_action :correct_sector, only: [:index, :edit, :update]

    def index

    end
    
    def gallery
    end

    def edit
        @page = StaticPage.find_by_page_id(params[:id]) || not_found
    end

    def update
        @page = StaticPage.find_by_page_id(params[:id]) || not_found
        if @page.update_attributes(static_page_params)
            flash[:success] = "Pagina modificata correttamente!"
            redirect_to admin_static_pages_url
        else
            render 'edit'
        end
    end
    
    private
    def correct_sector
        @sector = Sector.find_by_unique_name('societa')
        unless current_sector?(@sector)
            flash[:danger] = "Non puoi modificare le impostazioni di un altro amministratore."
            redirect_to(admin_sector_url(current_sector))
        end
    end

    private
    def static_page_params
        params.require(:static_page).permit(:title, :content)
    end
end

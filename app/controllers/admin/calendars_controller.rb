class Admin::CalendarsController < AuthAdminController
    before_action :current_category
    before_action :correct_sector, only: [:edit, :update, :destroy]

    def index
        @calendars = @category.calendars
    end

    def new
        @calendar = @category.calendars.build
    end

    def create
        @calendar = @category.calendars.build(calendar_params)
        if @calendar.save
            flash[:success] = "Calendario inserito con successo!"
            redirect_to admin_category_calendars_url(@category)
        else
            render 'new'
        end
    end

    def edit
        @matches = @calendar.matches
    end

    def update
        if @calendar.update_attributes(calendar_params)
            flash[:success] = "Calendario modificato correttamente!"
            redirect_to admin_category_calendars_path(@category)
        else
            render 'edit'
        end
    end

    def destroy
        @calendar.destroy
        redirect_to admin_category_calendars_path(@category)
    end

    def sort
        @calendars = @category.calendars
        @calendars.each do |calendar|
            calendar.position = params['calendar'].index(calendar.id.to_s) + 1
            calendar.save
        end
        render :nothing => true
    end

    private
    def correct_sector
        category = current_sector.categories.find_by(id: params[:category_id])
        @calendar = category.calendars.find_by(id: params[:id])
        redirect_to admin_url if category.nil? || @calendar.nil?
    end

    private def current_category
        @category = current_sector.categories.find_by(id: params[:category_id])
    end

    private
    def calendar_params
        params.require(:calendar).permit(:name, :link)
    end
end

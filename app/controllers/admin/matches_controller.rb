class Admin::MatchesController < AuthAdminController
    before_action :current_calendar
    before_action :correct_sector, only: [:edit, :update, :destroy]

    def index
        @matches = @calendar.matches
    end

    def new
        @match = @calendar.matches.build
    end

    def create
        @match = @calendar.matches.build(match_params)
        if @match.save
            flash[:success] = "Partita inserita con successo!"
            redirect_to edit_admin_category_calendar_url(@category, @calendar)
        else
            render 'new'
        end
    end

    def edit
        
    end

    def update
        if @match.update_attributes(match_params)
            flash[:success] = "Partita modificata correttamente!"
            redirect_to edit_admin_category_calendar_path(@category, @calendar)
        else
            render 'edit'
        end
    end

    def destroy
        @match.destroy
        redirect_to edit_admin_category_calendar_path(@category, @calendar)
    end

    def sort
        @matches = @calendar.matches
        @matches.each do |match|
            match.position = params['match'].index(match.id.to_s) + 1
            match.save
        end
        render :nothing => true
    end

    private
    def correct_sector
        category = current_sector.categories.find_by(id: params[:category_id])
        @calendar = category.calendars.find_by(id: params[:calendar_id])
        @match = @calendar.matches.find_by(id: params[:id])
        redirect_to admin_url if category.nil? || @calendar.nil? || @match.nil?
    end

    private def current_calendar
        @category = current_sector.categories.find_by(id: params[:category_id])
        @calendar = @category.calendars.find_by(id: params[:calendar_id])
    end

    private
    def match_params
        params.require(:match).permit(:home, :guests, :where, :day, :date, :time)
    end
end

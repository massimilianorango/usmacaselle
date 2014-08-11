class Admin::SchedulesController < AuthAdminController
    before_action :current_category
    before_action :correct_sector, only: [:edit, :update, :destroy]

    def index
        @schedules = @category.schedules
    end

    def new
        @schedule = @category.schedules.build
    end

    def create
        sp = schedule_params
        sp[:map] = parse_map sp[:map] if !sp[:map].empty?
        @schedule = @category.schedules.build(sp)
        if @schedule.save
            flash[:success] = "Orario inserito con successo!"
            redirect_to admin_category_schedules_url(@category)
        else
            render 'new'
        end
    end

    def edit

    end

    def update
        old_map = @schedule.map
        sp = schedule_params
        sp[:map] = parse_map sp[:map] if !sp[:map].empty?
        if @schedule.update_attributes(sp)
            @schedule.save
            flash[:success] = "Orario modificato correttamente!"
            redirect_to admin_category_schedules_path(@category)
        else
            @schedule.map = old_map
            render 'edit'
        end
    end

    def destroy
        @schedule.destroy
        redirect_to admin_category_schedules_path(@category)
    end

    def sort
        @schedules = @category.schedules
        @schedules.each do |schedule|
            schedule.position = params['schedule'].index(schedule.id.to_s) + 1
            schedule.save
        end
        render :nothing => true
    end

    private
    def correct_sector
        category = current_sector.categories.find_by(id: params[:category_id])
        @schedule = category.schedules.find_by(id: params[:id])
        redirect_to admin_url if category.nil? || @schedule.nil?
    end

    private def current_category
        @category = current_sector.categories.find_by(id: params[:category_id])
    end

    private
    def schedule_params
        params.require(:schedule).permit(:day, :time, :where, :map)
    end

    private
    def parse_map map_code
        map_src = ""
        if !map_code.nil?
            begin
                html_map = Nokogiri::HTML(map_code) { |config| config.strict }
                map_src = html_map.at_xpath('//*//iframe/@src').to_s
            rescue Nokogiri::XML::SyntaxError => e
                map_src = nil
            end
        end
        map_src = nil if map_src.empty?
        map_src
    end
end

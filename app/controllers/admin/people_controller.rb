class Admin::PeopleController < AuthAdminController
    before_action :current_category
    before_action :correct_sector, only: [:edit, :update, :destroy]

    def index
        @people = @category.people
    end

    def new
        @person = @category.people.build
    end

    def create
        @person = @category.people.build(person_params)
        if @person.save
            flash[:success] = "Persona inserita con successo!"
            redirect_to admin_category_people_url(@category)
        else
            render 'new'
        end
    end

    def edit
        
    end

    def update
        if @person.update_attributes(person_params)
            flash[:success] = "Persona modificata correttamente!"
            redirect_to admin_category_people_path(@category)
        else
            render 'edit'
        end
    end

    def destroy
        @person.destroy
        redirect_to admin_category_people_path(@category)
    end

    def sort
        @people = @category.people
        @people.each do |person|
            person.position = params['person'].index(person.id.to_s) + 1
            person.save
        end
        render :nothing => true
    end

    private
    def correct_sector
        category = current_sector.categories.find_by(id: params[:category_id])
        @person = category.people.find_by(id: params[:id])
        redirect_to admin_url if category.nil? || @person.nil?
    end

    private def current_category
        @category = current_sector.categories.find_by(id: params[:category_id])
    end

    private
    def person_params
        params.require(:person).permit(:first_name, :last_name, :image, :role, :description)
    end
end

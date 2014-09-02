class Admin::CategoriesController < AuthAdminController
    before_action :correct_sector, only: [:edit, :update, :destroy]

    def index
        @categories = @sector.categories
    end

    def new
        @category = current_sector.categories.build
    end

    def create
        @category = current_sector.categories.build(category_params)
        if @category.save
            flash[:success] = "Categoria inserita con successo!"
            redirect_to admin_categories_url
        else
            render 'new'
        end
    end

    def edit

    end

    def update
        if @category.update_attributes(category_params)
            flash[:success] = "Categoria modificata correttamente!"
            redirect_to admin_categories_url
        else
            render 'edit'
        end
    end

    def destroy
        @category.destroy
        redirect_to admin_categories_path
    end

    def sort
        @categories = @sector.categories
        @categories.each do |category|
            category.position = params['category'].index(category.id.to_s) + 1
            category.save
        end
        render :nothing => true
    end

    private
    def correct_sector
        @category = current_sector.categories.find_by(id: params[:id])
        redirect_to admin_url if @category.nil?
    end

    private
    def category_params
        params.require(:category).permit(:name, :image, :remove_image)
    end
end

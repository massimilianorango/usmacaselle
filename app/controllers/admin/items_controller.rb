class Admin::ItemsController < AuthAdminController
    before_action :correct_sector, only: [:destroy]
    before_action :not_root

    def index
        @items = @sector.items #TODO: paginate
    end

    def new
        @item = current_sector.items.build
    end

    def create
        @item = current_sector.items.build(item_params)
        @item.position = 0
        if @item.save
            flash[:success] = "Articolo inserito con successo!"
            redirect_to admin_items_url
        else
            render 'new'
        end
    end

    def destroy
        @item.destroy
        redirect_to admin_items_path
    end

    def sort
        @items = @sector.items
        @items.each do |item|
            item.position = params['item'].index(item.id.to_s) + 1
            item.save
        end
        render :nothing => true
    end

    private
    def item_params
        params.require(:item).permit(:name, :image, :price)
    end

    private
    def correct_sector
        @item = current_sector.items.find_by(id: params[:id])
        redirect_to admin_url if @item.nil?
    end

    private
    def not_root
        redirect_to admin_url if current_sector.is_root
    end
end

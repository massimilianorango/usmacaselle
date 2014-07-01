class Admin::ItemsController < AuthAdminController
    before_action :correct_sector, only: [:destroy]

    def index
        @items = @sector.items
    end

    def new
        @item = current_sector.items.build
    end

    def create
        @item = current_sector.items.build(item_params)
        if @item.save
            flash[:success] = "Articolo inserito con successo!"
            redirect_to admin_items_url
        else
            @item.errors.delete(:image)
            render 'new'
        end
    end

    def destroy
        @item.destroy
        redirect_to admin_items_path
    end

    def reorder
        @item_ids = params[:objects].reverse
        n = 1
        ActiveRecord::Base.transaction do
            @item_ids.each do |id|
                item = Item.find(id)
                item.priority = n
                n += 1
                item.save
            end
        end
        flash[:success] = "Ordinamento salvato con successo!"
        render index
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
end

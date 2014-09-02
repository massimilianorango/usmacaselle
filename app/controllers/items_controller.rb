class ItemsController < ApplicationController
    def index 
        public_parameters
        @items = (@sector.is_root ? Item.reorder(:sector_id, :position) : Item.where('sector_id = ?', @sector.id)).paginate(page: params[:page], per_page: 12)
    end

    def show
        public_parameters
        @item = Item.find(params[:id]) || not_found
    end

    def question
        sector = Sector.find_by_unique_name(params[:sector_id])
        item = Item.find(params[:item_id])
        if params[:name].empty? || params[:surname].empty? || params[:email].empty? || params[:tel].empty? || params[:question].empty? || params[:terms_of_service].nil?
            flash[:danger] = "Compila tutti i campi del form. Ricorda di spuntare la casella per il trattamento dei dati personali."
            redirect_to sector_item_path(sector, item)
        else
            SectorMailer.item_question(sector, item, params[:name], params[:surname], params[:email], params[:tel], params[:question]).deliver if sector && item
            flash[:info] = "E` stata inviata un'email con la domanda da te richiesta. Ti risponderemo al più presto."
            redirect_to sector_item_path(sector, item)
        end
    end
end

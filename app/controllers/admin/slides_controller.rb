class Admin::SlidesController < AuthAdminController
    before_action :correct_sector, only: [:destroy]

    def index
        @slides = @sector.slides
    end

    def new
        @slide = current_sector.slides.build
    end

    def create
        @slide = current_sector.slides.build(slide_params)
        if @slide.save
            flash[:success] = "Slide inserita con successo!"
            redirect_to admin_slides_url
        else
            @slide.errors.delete(:image)
            render 'new'
        end
    end

    def destroy
        @slide.destroy
        redirect_to admin_slides_path
    end

    def reorder
        @slide_ids = params[:objects].reverse
        n = 1
        ActiveRecord::Base.transaction do
            @slide_ids.each do |id|
                slide = Slide.find(id)
                slide.priority = n
                n += 1
                slide.save
            end
        end
        flash[:success] = "Ordinamento salvato con successo!"
        render index
    end

    private
    def slide_params
        params.require(:slide).permit(:text, :image, :link)
    end

    private
    def correct_sector
        @slide = current_sector.slides.find_by(id: params[:id])
        redirect_to admin_url if @slide.nil?
    end
end

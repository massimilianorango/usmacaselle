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

    def sort
        @slides = @sector.slides
        @slides.each do |slide|
            slide.position = params['slide'].index(slide.id.to_s) + 1
            slide.save
        end
        render :nothing => true
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

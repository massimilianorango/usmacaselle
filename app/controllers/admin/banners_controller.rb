class Admin::BannersController < AuthAdminController
    before_action :correct_sector, only: []

    def index
        @h_banners = Banner.where(is_horizontal: true)
        @v_banners = Banner.where(is_horizontal: false)
    end

    def new_horizontal
        @banner = Banner.new
    end

    def new_vertical
        @banner = Banner.new
    end

    def create
        @banner = Banner.new(banner_params)
        @banner.image = params[:banner][:image]
        @banner.position = 0
        if @banner.save
            flash[:success] = "Banner inserito con successo!"
            redirect_to admin_banners_url
        else
            render 'new_horizontal'
        end
    end

    def h_sort
        sort true
    end

    def v_sort
        sort false
    end

    def destroy
        Banner.find(params[:id]).destroy
        redirect_to admin_banners_path
    end

    private
    def banner_params
        params.require(:banner).permit(:image, :link, :is_horizontal)
    end

    private
    def sort is_h
        @banners = Banner.where(is_horizontal: is_h)
        banner_type = is_h ? 'h_banner' : 'v_banner'
        @banners.each do |banner|
            banner.position = params[banner_type].index(banner.id.to_s) + 1
            banner.save
        end
        render :nothing => true
    end
end

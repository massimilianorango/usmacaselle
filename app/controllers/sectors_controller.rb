class SectorsController < ApplicationController
    def show
        @sector = Sector.find_by_unique_name(params[:unique_name]) || not_found
        @slides = Slide.where('sector_id = ?', @sector.id)
        @h_banners = Banner.where('is_horizontal = ?', true)
        @v_banners = Banner.where('is_horizontal = ?', false)
        @posts = Post.where('sector_id = ?', @sector.id).limit(4)
    end
end

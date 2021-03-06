class SectorsController < ApplicationController
    def show
        @sector = Sector.find_by_unique_name(params[:id]) || not_found
        @slides = Slide.where('sector_id = ?', @sector.id)
        @h_banners = Banner.where('is_horizontal = ?', true)
        @v_banners = Banner.where('is_horizontal = ?', false)
        @categories = Category.where('sector_id = ?', @sector.id)
        @posts = Post.where('sector_id = ?', @sector.id).limit(4)
    end
end

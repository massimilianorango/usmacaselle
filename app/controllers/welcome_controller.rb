class WelcomeController < ApplicationController
    def index
        @sector = Sector.where('is_root = ?', true).first;
        @sectors = Sector.where('is_root = ?', false)
        @slides = Slide.where('sector_id = ?', @sector.id)
        @h_banners = Banner.where('is_horizontal = ?', true)
        @v_banners = Banner.where('is_horizontal = ?', false)
        @posts = Post.where('sector_id = ?', @sector.id).limit(4)
    end
end

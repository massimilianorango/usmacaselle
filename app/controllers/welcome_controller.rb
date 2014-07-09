class WelcomeController < ApplicationController
    def index
        @sectors = Sector.where('is_root = ?', false)
        @slides = Slide.where('sector_id = ?', 1)
        @h_banners = Banner.where('is_horizontal = ?', true)
        @v_banners = Banner.where('is_horizontal = ?', false)
        @posts = Post.where('sector_id = ?', 1).limit(4)
    end
end

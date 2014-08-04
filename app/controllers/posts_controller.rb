class PostsController < ApplicationController
    def index 
        public_parameters
        @posts = Post.where('sector_id = ?', @sector.id).paginate(page: params[:page], per_page: 10)
    end

    def show
        public_parameters
        @post = Post.find(params[:id]) || not_found
    end
end

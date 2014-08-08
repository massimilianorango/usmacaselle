class CategoriesController < ApplicationController
    def index 
        public_parameters
        #TODO static page
    end

    def show
        public_parameters
        @category = Category.find(params[:id]) || not_found
    end
end

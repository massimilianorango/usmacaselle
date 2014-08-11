class CategoriesController < ApplicationController
    def index
        public_parameters
        #TODO static page
    end

    def show
        public_parameters
        @category = Category.find(params[:id]) || not_found
    end

    def calendars
        public_parameters
        @category = Category.find(params[:id]) || not_found
        @calendars = @category.calendars
    end

    def schedules
        public_parameters
        @category = Category.find(params[:id]) || not_found
        @schedules = @category.schedules
    end
end

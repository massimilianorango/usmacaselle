class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    def not_found
        raise ActionController::RoutingError.new('Not Found')
    end

    def public_parameters
        @sectors = Sector.where('is_root = ?', false)
        @h_banners = Banner.where('is_horizontal = ?', true)
        @v_banners = Banner.where('is_horizontal = ?', false)
        @sector = Sector.find_by_unique_name(params[:sector_id])
        @categories = @sector.categories
    end
end

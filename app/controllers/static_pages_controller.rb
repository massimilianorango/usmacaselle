class StaticPagesController < ApplicationController
  
  def ie_compatibility
  end

  def show
    @page = StaticPage.find_by_page_id(params[:page_id]) || not_found
    public_parameters
  end

end

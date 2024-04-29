class CmsPagesController < ApplicationController
  def show
    @cms_page = CmsPage.find_by(slug: params[:slug])
    render :not_found if @cms_page.nil?
  end
end

class CmsPagesController < ApplicationController
  def show
    @cms_page = CmsPage.find_by(slug: params[:slug])
    render :not_found if @cms_page.nil?
  end

private

def cms_page_params
  params.require(:cms_page).permit(:title, :slug, :description )
end
end
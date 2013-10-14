class Frontend::PagesController < Frontend::ApplicationController
  def show
    @page = Page.where(slug: params[:slug]).first
  end
end

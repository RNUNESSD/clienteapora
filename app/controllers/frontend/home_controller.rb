class Frontend::HomeController < Frontend::ApplicationController
  def index
  end

  def create_newsletter
    @newsletter = Newsletter.new(params[:newsletter])

    if @newsletter.save
      redirect_to root_url, :notice => 'Newsletter cadastrado com sucesso.'
    else
      render :index
    end
  end
end

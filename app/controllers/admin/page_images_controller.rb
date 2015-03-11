class Admin::PageImagesController < Admin::PositionUpdaterController
  belongs_to :page, parent_class: Page

  def create
    @gallery = Page.find params[:page_id]

    @image = @gallery.page_images.build

    @image.image = params[:file]

    @image.save

    render nothing: true
  end

  def destroy
    destroy! { parent_path }
  end

  def update
    update! { resource_path }
  end
  
end

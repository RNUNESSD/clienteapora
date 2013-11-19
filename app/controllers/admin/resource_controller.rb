class Admin::ResourceController < Admin::ApplicationController
  inherit_resources
  authorize_resource

  def create
    create! { collection_path }
  end

  def update
    update! { collection_path }
  end

  protected
  def collection
    @projects ||= end_of_association_chain.paginate(:page => params[:page])
  end
end

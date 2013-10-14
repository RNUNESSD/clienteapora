class Admin::ResourceController < Admin::ApplicationController
  inherit_resources
  authorize_resource

  def create
    create! { collection_path }
  end

  def update
    update! { collection_path }
  end

end

class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  before_filter :defaults, :authenticate_user!
  respond_to :html
  layout 'admin'

  def defaults
    @article_categories_menu = ArticleCategory.active
  end
end

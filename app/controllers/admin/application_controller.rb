class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  before_action :defaults, :authenticate_user!
  layout 'admin'

  WillPaginate.per_page = 10

  def defaults
    @article_categories_menu = ArticleCategory.active
    @email_categories_menu = EmailCategory.all
  end
end

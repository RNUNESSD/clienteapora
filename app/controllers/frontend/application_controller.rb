class Frontend::ApplicationController < ActionController::Base
  before_filter :initializers
  protect_from_forgery
  layout 'frontend'

  def initializers
  end
end

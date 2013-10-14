class Admin::UsersController < Admin::ResourceController
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    update! { collection_path }
  end
end

class Admin::UsersController < Admin::ResourceController
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    update! { collection_path }
  end

  def create
    
    role = Role.find params[:user][:role_id]
    
    if role.name == "Admin"

      User.find_or_create_by(email: params[:user][:email]) do |u|
        u.password = params[:user][:password]
        u.is_active = true
        u.role = Role.where(name: 'Admin').first
        u.is_admin = true
      end

      redirect_to collection_path
    else
      create! { collection_path } 
    end
  end
  
end
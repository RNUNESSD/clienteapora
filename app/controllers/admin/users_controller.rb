class Admin::UsersController < Admin::ResourceController
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    update! { collection_path }
  end

  def create
    
  	unless params[:user][:role_id].present?
      user  = User.new(email: params[:user][:email], password: params[:user][:password], is_active: params[:user][:is_active])
      user.role = Role.where(name: 'Cliente').first    
      user.save
      redirect_to collection_path    
    else
      create! { collection_path } 
    end
  end

  def collection  	
    if current_user.role.name != "Admin"
      collection = Role.where(name: 'Cliente').first.users
    else
      collection = User.all
    end
    collection.paginate(:page => params[:page])
  end
end
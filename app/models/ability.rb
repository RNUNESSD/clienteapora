class Ability
  include CanCan::Ability

  def initialize(user)

    if user.is_admin?
      can :manage, :all
    else
     user.roles.each do |role|
       role.permissions.each do |permission|
         can permission.action_name.to_sym, permission.object_type.constantize
       end
     end
    end
  end
end

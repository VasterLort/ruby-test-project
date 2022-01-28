class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin_role?
      can :manage, :all
      can :manage, :dashboard    # allow access to dashboard
      can :access, :rails_admin  # only allow admin users to access Rails Admin
    elsif user.user_role?
      can [:read, :create], Post
      can [:update, :destroy], Post do |post|
        post.try(:user) == user
      end
    else
      can :read, Post   
    end
  end
end

class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
    else
      can :read, :all
    end
  end

  # def initialize(user)
  #   # user ||= User.new
  #   unless user
  #     can :read, :all
  #   else
  #     if user.role? :admin
  #        can :manage, :all
  #      else
  #        can :read, :all
  #        can :update, User do |u|
  #           u.id == user.id
  #           end
  #        can :create, Viewing do |v|
  #           v.user_id == user.id
  #           end
  #         can :new, Viewing
  #      end
  #     end
  #   end
end

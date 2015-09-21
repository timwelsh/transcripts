class Ability
  require 'date'
  include CanCan::Ability
  def initialize(user)
    alias_action :read , :update , :destroy, :to => :rud
    user ||= User.new # guest user (not logged in)
    if !user.subscription.nil?
        can :create , School if !user.school
        can :rud, School if user.subscription.plan_end_date > Date.today 
        can :manage, Student if user.subscription.plan_end_date > Date.today 
        can :manage, Plan if !user.blank?
    else
        can :manage, Plan if !user.blank?
    end

    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
end

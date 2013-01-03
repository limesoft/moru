# encoding: utf-8

module Ability

  def self.for(guest)
    guest ||= User.new # guest user (not logged in)
    if guest.admin?
      AdminAbility.new(guest)
    elsif guest.user?
      UserAbility.new(guest)
    else
      GuestAbility.new(guest)
    end
  end

  ##
  # Guest abilities
  class GuestAbility
    include CanCan::Ability

    def initialize(user)
      can :manage, Event
      can :read, User
      can :read, Comment
    end
  end

  ##
  # User abilities
  class UserAbility
    include CanCan::Ability

    def initialize(user)
      can :read, Event
      can :read, User
      can :read, Comment

      can :manage, Comment, user_id: user.id
    end
  end

  ##
  # Admin abilities
  class AdminAbility
    include CanCan::Ability

    def initialize(user)
      can :manage, Event
      can :manage, User
      can :manage, Comment
    end
  end
end

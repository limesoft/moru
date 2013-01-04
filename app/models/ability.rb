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
      can :read, Rsvp
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
      can :read, Rsvp

      can :manage, Comment, user_id: user.id
      can :manage, Rsvp, user_id: user.id
    end
  end

  ##
  # Admin abilities
  class AdminAbility
    include CanCan::Ability

    def initialize(user)
      can :manage, Event
      can :manage, Authentication
      can :manage, User
      can :manage, Comment
      can :manage, Rsvp
    end
  end
end

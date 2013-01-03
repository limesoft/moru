# encoding: utf-8

module Ability

  def self.for(user)

    user ||= User.new # guest user (not logged in)

    if user.is_admin?
      AdminAbility.new(user)
    elsif user.is_user?
      UserAbility.new(user)
    end
  end

  ##
  # Admin abilities
  class AdminAbility
    include CanCan::Ability

    def initialize(user)

    end
  end


  ##
  # User abilities
  class UserAbility
    include CanCan::Ability

    def initialize(user)

    end
  end
end

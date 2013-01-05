# encoding: utf-8

class AuthenticationService

  def initialize(omniauth)
    @omniauth = omniauth
  end

  def authenticated?
    user.present?
  end

  def already_registered?
    User.exists?(email: @omniauth.email)
  end

  def register
    if PROVIDERS.include?(@omniauth.provider)
      @user = User.new(email: @omniauth.email, role: ROLE_USER, name: @omniauth.name)
      @user.save(validate: false)
      add_authentication_to @user
      return @user
    end
    nil
  end

  def add_authentication_to(user)
    user.authentications << Authentication.new(provider: @omniauth.provider, uid: @omniauth.uid)
    user.save
  end

  def user
    @user ||= user_from_omniauth
  end

  private
    def user_from_omniauth
      auth = Authentication.find_by_provider_and_uid(@omniauth.provider, @omniauth.uid)
      return (auth.present? ? auth.user : nil)
    end
end

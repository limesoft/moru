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
    if [PROVIDER_FACEBOOK, PROVIDER_GOOGLE, PROVIDER_GITHUB].include?(@omniauth.provider)
    elsif PROVIDER_TWITTER == @omniauth.provider
      @user = User.new(email: "", name: @omniauth.name, role: ROLE_USER)
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

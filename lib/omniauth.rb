# encoding: utf-8

class Omniauth

  def initialize(omniauth)
    @omniauth = omniauth
  end

  def provider
    @omniauth[:provider].to_s.downcase
  end

  def uid
    @omniauth[:uid]
  end

  def email
    @omniauth[:info][:email].to_s.downcase
  end

  def name
    @omniauth[:info][:name]
  end
end

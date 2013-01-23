# encoding: utf-8

module OgpContext

  def get_facebook_token
    authentications.where(provider: PROVIDER_FACEBOOK).first.oauth_token
  end
end

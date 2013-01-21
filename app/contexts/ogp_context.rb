# encoding: utf-8

module OgpContext

  def get_facebook_uid
    authentications.where(provider: PROVIDER_FACEBOOK).first.uid
  end
end

# encoding: utf-8

require 'spec_helper'

describe OgpContext do

  let(:authentication) { Fabricate(:authentication, provider: PROVIDER_FACEBOOK) }
  let(:oauth_token) { authentication.oauth_token }
  subject do
    user = Fabricate(:user).extend(OgpContext)
    %w(twitter github google).each do |provider|
      user.authentications << Fabricate(:authentication, provider: provider)
    end
    user.authentications << authentication
    user.save
    user
  end

  context "#get_facebook_token" do
    it { should respond_to :get_facebook_token }
    its(:get_facebook_token) { should eq(oauth_token) }
  end
end

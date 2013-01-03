# encoding: utf-8

require 'spec_helper'

describe User do

  let(:user) { Fabricate(:user) }
  let(:authentications) do
    @authentications = []
    # 3.times { @authentications << Fabricate.build(:authentication, user: user) }
    @authentications
  end

  it { should respond_to :name }
  it { should respond_to :email }

  it "#has many authentications" do
    pending
    #user.authentications = authentications
    #user.save.should be_valid
  end
end

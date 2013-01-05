# encoding: utf-8

require 'spec_helper'

describe Authentication do

  it { should respond_to :provider }
  it { should respond_to :uid }
  it { should respond_to :user_id }
  it { should respond_to :email }
  it { should respond_to :default }

end

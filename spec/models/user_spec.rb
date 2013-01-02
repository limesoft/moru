# encoding: utf-8

require 'spec_helper'

describe User do
  let(:user) { Fabricate(:user) }

  it { should respond_to :name }
  it { should respond_to :email }
end

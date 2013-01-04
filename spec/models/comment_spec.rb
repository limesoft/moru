# encoding: utf-8

require 'spec_helper'

describe Comment do

  it { should respond_to :user_id }
  it { should respond_to :event_id }
  it { should respond_to :content }

end

# encoding: utf-8

require 'spec_helper'

describe Comment do

  it { should respond_to :user_id }
  it { should respond_to :content }
  it { should respond_to :commentable_id }
  it { should respond_to :commentable_type }

end

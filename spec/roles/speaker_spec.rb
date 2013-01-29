# encoding: utf-8
require 'spec_helper'

describe Speaker do

  let(:user) { User.new }
  let(:topic) { Fabricate(:topic) }

  it "#create_topic" do
    user.extend Speaker
    user.create_topic(topic).should be_true
  end

  it "#create_and_assign_topic" do
    user.extend Speaker
    user.create_and_assign_topic(topic).should be_true
    topic.speaker.should == user
  end

end

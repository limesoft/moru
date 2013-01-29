# encoding: utf-8
require 'spec_helper'

describe Speaker do

  let(:user) { Fabricate(:user) }
  let(:topic) { Fabricate(:topic) }

  before(:all) { user.extend Speaker }

  it "#create_topic" do
    user.create_topic(topic).should be_true
    topic.user.should == user
  end

  it "#create_and_assign_topic" do
    user.create_and_assign_topic(topic).should be_true
    topic.speaker.should == user
  end

  it "#assign_topic" do
    user.assign_topic topic
    topic.speaker.should == user
  end

  it "#unassign_topic" do
    user.assign_topic topic
    topic.speaker.should == user
    user.unassign_topic topic
    topic.speaker.should == nil
  end

end

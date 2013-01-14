# encoding: utf-8
require 'spec_helper'

describe Speaker do

  let(:user) { User.new }
  let(:topic) { Topic.new }

  it "#create_topic" do
    user.extend Speaker
    user.create_topic(topic).should be_true
  end

  it "#delete_topic" do
    user.extend Speaker
    user.create_topic topic
    user.delete_topic topic
    topic.speaker.should be_nil
  end
end

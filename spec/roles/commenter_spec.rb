# encoding: utf-8
require 'spec_helper'

describe Commenter do

  let(:user) { Fabricate(:user) }
  let(:comment) { Fabricate(:comment, user: user) }
  let(:event) { Fabricate(:event) }
  let(:blog_post) { Fabricate(:post) }

  before(:all) { user.extend Commenter }

  context "#create_comment" do
    it "on event" do
      user.create_comment(comment, event).should be_true
      comment.user.should == user
    end

    it "on post" do
      user.create_comment(comment, blog_post).should be_true
      comment.user.should == user
    end
  end
end

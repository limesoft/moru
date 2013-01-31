# encoding: utf-8

require 'spec_helper'

describe FeedbacksController do

 describe "POST create" do

  let(:feedback_params) { Fabricate.attributes_for(:feedback) }
  after(:each) { response.code.should == "200" }

  it "when user nog logged in" do
    expect {
      # making Ajax request
      xhr :post, :create, feedback: feedback_params
    }.to change(Feedback, :count).by(1)
  end

  it "when user logged in"
 end
end

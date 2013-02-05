# encoding: utf-8

require 'spec_helper'

shared_examples "rsvp_of" do

  let(:user) { Fabricate(:user) }

  before(:each) do
    login_in_as(user)
    @current_event = Fabricate(:event)
  end

  context "#rsvp" do
    before(:each) do
      expect {
        xhr :post, :create, rsvp: rsvp_param
      }.to change(Rsvp, :count).by(1)
      @rsvp = user.rsvp_of @current_event
    end

    it { @rsvp.going.should eq(user_rsvp) }
  end
end


describe RsvpsController do

  let(:rsvp_going) { {going: RSVP_YES} }
  let(:rsvp_maybe) { {going: RSVP_MAYBE} }
  let(:rsvp_not_going) { {going: RSVP_NO} }

  describe "#create" do
    it_behaves_like "rsvp_of" do
      let(:rsvp_param) { rsvp_going }
      let(:user_rsvp) { RSVP_YES }
    end

    it_behaves_like "rsvp_of" do
      let(:rsvp_param) { rsvp_maybe }
      let(:user_rsvp) { RSVP_MAYBE }
    end

    it_behaves_like "rsvp_of" do
      let(:rsvp_param) { rsvp_not_going }
      let(:user_rsvp) { RSVP_NO }
    end
  end
end

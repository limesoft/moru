# encoding: utf-8

require 'spec_helper'

shared_examples "rsvp_new" do

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

shared_examples "rsvp_update" do
  let(:user) { Fabricate(:user) }

  before(:each) do
    user.extend RsvpContext
    @rsvp = user.send(:create_rsvp, Fabricate(:event), RSVP_YES)
    puts '----------------------', @rsvp.class
    @rsvp_old_value = @rsvp.going
    login_in_as user
  end

  context "#rsvp" do
    it do
      expect {
        xhr :post, :create, rsvp: rsvp_param
      }.to change(@rsvp, :going).from(@rsvp_old_value).to(user_rsvp)
    end
  end
end


describe RsvpsController do

  let(:rsvp_going) { {going: RSVP_YES} }
  let(:rsvp_maybe) { {going: RSVP_MAYBE} }
  let(:rsvp_not_going) { {going: RSVP_NO} }

  describe "#create" do
    context "#new" do
      it_behaves_like "rsvp_new" do
        let(:rsvp_param) { rsvp_going }
        let(:user_rsvp) { RSVP_YES }
      end

      it_behaves_like "rsvp_new" do
        let(:rsvp_param) { rsvp_maybe }
        let(:user_rsvp) { RSVP_MAYBE }
      end

      it_behaves_like "rsvp_new" do
        let(:rsvp_param) { rsvp_not_going }
        let(:user_rsvp) { RSVP_NO }
      end
    end

    context "#update" do
      it_behaves_like "rsvp_update" do
        let(:rsvp_param) { rsvp_maybe }
        let(:user_rsvp) { RSVP_MAYBE }
      end
    end
  end
end

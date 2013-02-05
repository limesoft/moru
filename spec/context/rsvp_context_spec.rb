# encoding: utf-8

require 'spec_helper'

describe RsvpContext do

  subject { Fabricate(:user).extend RsvpContext }
  let(:event) { Fabricate(:event) }
  let(:random_rsvp) { RSVPS.sample }

  context "#new_rsvp" do
    it { should respond_to :new_rsvp }
    it "store event and going" do
      rsvp = subject.new_rsvp(event, random_rsvp)
      rsvp.event.should eq(event)
      rsvp.going.should eq(random_rsvp)
    end
  end

  context "#create_rsvp" do
    it { should respond_to :create_rsvp }
    it "create new rsvp" do
      expect {
        subject.create_rsvp(event, random_rsvp)
      }.to change(Rsvp, :count).by(1)
    end
  end

  context "#add_rsvp" do
    it { should respond_to :add_rsvp }
  end
end

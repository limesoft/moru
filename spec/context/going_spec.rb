# encoding: utf-8

require "spec_helper"

describe GoingContext do

  let(:user) { Fabricate(:user) }
  subject { Fabricate(:event).extend GoingContext }
  before(:all) do
    4.times { subject.rsvps << Fabricate(:rsvp, going: RSVP_YES) }
    5.times { subject.rsvps << Fabricate(:rsvp, going: RSVP_MAYBE) }
    3.times { subject.rsvps << Fabricate(:rsvp, going: RSVP_NO) }
    subject.save
  end

  context "#count_going" do
    it { should respond_to :count_going }
    its(:count_going) { should eq(4) }
  end

  context "#count_maybe" do
    it { should respond_to :count_maybe }
    its(:count_maybe) { should eq(5) }
  end

  context "#count_not_going" do
    it { should respond_to :count_not_going }
    its(:count_not_going) { should eq(3) }
  end

  context "#find_goings" do
    it { should respond_to :find_goings }
  end
end

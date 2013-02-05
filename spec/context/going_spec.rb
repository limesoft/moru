# encoding: utf-8

require "spec_helper"

describe GoingContext do

  let(:user) { Fabricate(:user) }
  let(:event) { Fabricate(:event) }
  subject { Fabricate(:rsvp, event: event, user: user).extend GoingContext }

  context "#count_going" do
    it { should respond_to :count_going }
  end

  context "#count_maybe" do
    it { should respond_to :count_maybe }
  end

  context "#count_not_going" do
    it { should respond_to :count_not_going }
  end

  context "#find_goings" do
    it { should respond_to :find_goings }
  end
end

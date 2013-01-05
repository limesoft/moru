# encoding: utf-8

require 'spec_helper'
require 'cancan/matchers'

describe User do

  it { should respond_to :name }
  it { should respond_to :role }

  describe "abilities" do
    subject { ability }
    let(:ability) { Ability.for(user) }
    let(:user) { nil }

    context "when is a guest" do
      let(:user) { User.new }

      it { should be_able_to(:read, Event.new) }
      it { should be_able_to(:read, Comment.new) }
      it { should be_able_to(:read, User.new) }
      it { should be_able_to(:read, Rsvp.new) }
    end

    context "when is a user" do
      let(:user) { User.new(role: ROLE_USER) }

      it { should be_able_to(:read, Comment.new) }
      it { should be_able_to(:read, User.new) }
      it { should be_able_to(:read, Rsvp.new) }
      it { should be_able_to(:read, Event.new) }
    end

    context "when is an admin" do
      let(:user) { User.new(role: ROLE_ADMIN) }

      it { should be_able_to(:manage, Event.new) }
      it { should be_able_to(:manage, Comment.new) }
      it { should be_able_to(:manage, Rsvp.new) }
      it { should be_able_to(:manage, User.new) }
      it { should be_able_to(:manage, Authentication.new) }
    end
  end
end

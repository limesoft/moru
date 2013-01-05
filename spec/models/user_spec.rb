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
    let(:event) { Event.new }
    let(:comment) { Comment.new }
    let(:another_user) { User.new }
    let(:rsvp) { Rsvp.new }
    let(:topic) { Topic.new }
    let(:authentication) { Authentication.new }

    context "when is a guest" do
      let(:user) { User.new }

      it { should be_able_to(:read, event) }
      it { should be_able_to(:read, comment) }
      it { should be_able_to(:read, another_user) }
      it { should be_able_to(:read, rsvp) }
      it { should be_able_to(:read, topic) }
    end

    context "when is a user" do
      let(:user) { User.new(role: ROLE_USER) }

      it { should be_able_to(:read, event) }
      it { should be_able_to(:read, comment) }
      it { should be_able_to(:read, another_user) }
      it { should be_able_to(:read, rsvp) }
      it { should be_able_to(:read, topic) }
      it { should be_able_to(:read, authentication) }
      it { should be_able_to(:create, authentication) }
    end

    context "when is an admin" do
      let(:user) { User.new(role: ROLE_ADMIN) }

      it { should be_able_to(:manage, event) }
      it { should be_able_to(:manage, comment) }
      it { should be_able_to(:manage, rsvp) }
      it { should be_able_to(:manage, another_user) }
      it { should be_able_to(:manage, authentication) }
      it { should be_able_to(:manage, topic) }
    end
  end
end

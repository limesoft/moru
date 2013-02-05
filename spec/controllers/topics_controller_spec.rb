# encoding: utf-8

require 'spec_helper'

describe TopicsController do

  let(:topic) { Fabricate(:topic) }
  let(:user) { Fabricate(:user) }
  let(:topic_params) { Fabricate.attributes_for(:topic) }

  context "GET index" do
    before(:each) { get :index }
    it { assigns(:topics).should eq([topic]) }
    it { response.should render_template :index }
  end

  context "GET show" do
    before(:each) { get :show, id: topic.id }
    it { response.should render_template :show }
    it { assigns(:topic).should eq(topic) }
  end

  describe "POST create" do
    before(:each) { login_in_as(user) }
    context "#topic_type" do
      it 'when it "yes"' do
        topic_params[:type] = 'yes'
        expect {
          xhr :post, :create, topic: topic_params
        }.to change(Topic, :count).by(1)
      end

      it 'when it "no"' do
        topic_params[:type] = 'no'
        expect {
          xhr :post, :create, topic: topic_params
        }.to change(Topic, :count).by(1)
      end

      it 'when it is not set' do
        expect {
          xhr :post, :create, topic: topic_params
        }.to change(Topic, :count).by(0)
      end
    end
  end

  describe "PUT assign" do
    before(:each) { login_in_as(user) }

    it "#assign" do
      expect {
        xhr :put, :assign, id: topic.id
        topic.reload
      }.to change(topic, :speaker_id).from(nil).to(user.id)
    end
  end

  describe "PUT unassign" do
    before(:each) do
      login_in_as(user)
      topic.speaker = user
      topic.save
    end

    it "#unassign" do
      expect {
        xhr :put, :unassign, id: topic.id
        topic.reload
      }.to change(topic, :speaker_id).from(user.id).to(nil)
    end
  end

  describe "PUT upvote" do
    before(:each) { login_in_as(user) }

    it "#upvote" do
      expect {
        xhr :put, :upvote, id: topic.id
        topic.reload
      }.to change(topic, :cached_votes_up).by(1)
    end
  end

end

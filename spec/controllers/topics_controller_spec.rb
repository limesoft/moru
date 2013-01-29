# encoding: utf-8

require 'spec_helper'

describe TopicsController do

  let(:topic) { Fabricate(:topic) }

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

end

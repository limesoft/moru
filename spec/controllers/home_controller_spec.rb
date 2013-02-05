# encoding: utf-8

require 'spec_helper'

describe HomeController do

  describe "GET index" do

    it "render index template" do
      get :index
      response.should render_template :index
    end

    context "#latest_post" do
      # FIXME: Why this test fail? Never mind ???????????????
      before(:each) do
        @posts = []
        5.times { @posts << Fabricate(:post) }
      end

      it "#latest_post" do
        get :index
        assigns(:latest_post).should eq([@posts.last])
      end
    end

    context "#current_event" do
      # TODO: write test for current_event helper method
      # it { assigns(:current_event).should eq(@current_event) }
    end
  end
end

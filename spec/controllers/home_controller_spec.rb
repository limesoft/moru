# encoding: utf-8

require 'spec_helper'

describe HomeController do


  describe "GET index" do

    it "render index template" do
      get :index
      response.should render_template :index
    end

    context "#latest_post" do
      # FIXME: Why this test failed? Never mind ???????????????
      before(:each) do
        @posts = []
        5.times { @posts << Fabricate(:post) }
        get :index
      end

      it { assigns(:latest_post).should eq([@posts.last]) }
    end

    context "#current_event" do
      # TODO: write test for current_event helper method
    end
  end
end

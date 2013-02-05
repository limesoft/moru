# encoding: utf-8

require 'spec_helper'

describe EventsController do

  let(:event) { Fabricate(:event) }

  context "GET index" do
    before(:each) { get :index }
    it { assigns(:events).should eq([event]) }
    it { response.should render_template :index }
  end

  context "GET show" do
    before(:each) { get :show, id: event.id }
    it { assigns(:event).should eq(event) }
    it { response.should render_template :show }
  end

end

# encoding: utf-8

require 'spec_helper'

describe PostsController do

  let(:post) { Fabricate(:post) }
  let(:comments) do
    5.times { post.comments << Fabricate(:comment) }
    post.save
  end

  context "GET index" do

    before(:each) { get :index }

    it { assigns(:posts).should eq([post]) }
    it { response.should render_template :index }

  end

  context "GET show" do

    before(:each) { get :show, id: post.id }

    it { response.should render_template :show }
    it { assigns(:post).should eq(post) }
    # FIXME: it { assigns(:comments).should eq([comments]) }

  end
end

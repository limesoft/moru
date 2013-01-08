# encoding: utf-8

class TopicsController < ApplicationController

  def index
    @topics = Topic.order("created_at DESC")
    respond_with @topics
  end
end

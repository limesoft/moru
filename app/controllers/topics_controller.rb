# encoding: utf-8

class TopicsController < ApplicationController

  before_filter :extend_as_speaker, only: [:create, :destroy]
  respond_to :js

  def index
    @topics = Topic.order("created_at DESC")
    respond_with @topics
  end

  def create
    current_user.add_topic topic
    respond_with topic
  end

  def destroy
    current_user.delete_topic topic
    respond_with topic
  end

  private
    def extend_as_speaker
      current_user.extend Speaker
    end

    def topic
      @topic ||= Topic.find(params.permit(:topic_id))
    end
end

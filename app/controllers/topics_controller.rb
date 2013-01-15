# encoding: utf-8

class TopicsController < ApplicationController

  before_filter :extend_as_speaker, only: [:create, :destroy]
  respond_to :js

	layout "events"
	
  def index
    @topics = Topic.order("created_at DESC")
    respond_with @topics
  end

  def create
    @topic = Topic.new(topic_params)
    if topic_type == 'yes'
      current_user.create_and_assign_topic @topic
    elsif topic_type == 'no'
      current_user.create_topic @topic
    else
      raise "Validation errors"
    end
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

    def topic_params
      params.require(:topic).permit(:content)
    end

    def topic_type
      params.require(:topic).permit(:type)[:type].to_s.downcase
    end
end

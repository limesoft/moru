# encoding: utf-8

class TopicsController < ApplicationController

  before_filter :become_speaker, only: [:create, :assign, :unassign]
  respond_to :js
	
  def index
    @topics = Topic.includes(:user).order("(cached_votes_up-cached_votes_down) DESC").page(params[:page]).per(6)
    respond_with @topics
  end

  def create
    @topic = Topic.new(topic_params)
    if topic_type == 'yes'
      current_user.create_and_assign_topic @topic
    elsif topic_type == 'no'
      current_user.create_topic @topic
    else
      @topic.errors.add(:type, "ярих эсэхээ сонгоно уу!")
    end
    respond_with @topic
  end

  def assign
    current_user.assign_topic topic
    respond_with topic
  end

  def unassign
    current_user.unassign_topic topic
    respond_with topic
  end

  def upvote
    topic.liked_by current_user
    respond_with topic
  end

  def downvote
    topic.downvote_from current_user
    respond_with topic
  end

  private
    def become_speaker
      current_user.extend Speaker
    end

    def topic
      @topic ||= Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:content, :title)
    end

    def topic_type
      params.require(:topic).permit(:type)[:type].to_s.downcase
    end
end

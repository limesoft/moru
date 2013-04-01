# encoding: utf-8

class TopicsController < ApplicationController

  before_filter :become_speaker, only: [:create, :assign, :unassign]
  respond_to :js, only: [:index, :create, :upvote, :downvote, :assign, :unassign]
	
  def index
    @topics = case params[:view].to_s
                when 'newest'
                  Topic.includes(:user).where("event_id IS NULL").order("created_at DESC")
                when 'voted'
                  Topic.includes(:user).where("event_id IS NULL").order("cached_votes_up DESC")
                when 'talked'
                  Topic.includes(:user, :event).where("event_id IS NOT NULL AND events.date < ?", DateTime.now).order("topics.created_at DESC")
                else
                  Topic.includes(:user).order("created_at DESC")
                end.page(params[:page]).per(5)
    respond_with @topics
  end

  def create
    @topic = Topic.new(topic_params)
    current_user.create_topic @topic
    # ogp.post_topic(current_user.id, @topic.id, topic_url(@topic)) if @topic.persisted?
    respond_with @topic
  end

  def show
    @topic = Topic.includes(votes: :voter).find(params[:id])
    @comments = @topic.comments.includes(:user).order("created_at DESC").page(params[:page]).per(10)
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
    if current_user.id != topic.user.id
      topic.liked_by current_user
      # ogp.post_on_wall(current_user.id, topic.id, topic_url(topic))
    end
    respond_with topic
  end

  def downvote
    if current_user.id != topic.user_id && current_user.voted_up_on?(topic)
      topic.downvote_from current_user
    end
    respond_with topic
  end

  private
    def become_speaker
      current_user.extend Speaker
    end

    def topic
      @topic ||= Topic.find(params[:id])
    end
    helper_method :topic

    def topic_params
      params.require(:topic).permit(:content, :title)
    end

    def topic_type
      params.require(:topic).permit(:type)[:type].to_s.downcase
    end

    #def ogp
    #  @ogp ||= FacebookOgpService.new
    #end
end

# encoding: utf-8

class CommentsController < ApplicationController

  before_filter :become_commenter, only: [:create, :index]

  # load_and_authorize_resource
  respond_to :js

  def index
    @comments = commentable.comments.includes(:user).order("created_at DESC").page(params[:page]).per(3)
    respond_with @comments
  end

  def create
    @comment = Comment.new(comment_params)
    current_user.create_comment @comment, commentable
    commentable.reload
    respond_with @comment
  rescue Exception => e
    puts '----------------- EXCEPTION'
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def commentable
      klass = [Event, Post].detect { |t| params["#{t.name.underscore}_id"] }
      @commentable ||= klass.find(params["#{klass.name.underscore}_id"])
    end

    def become_commenter
      current_user.extend Commenter
    end
end

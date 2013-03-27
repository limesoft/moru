# encoding: utf-8

class CommentsController < ApplicationController

  before_filter :become_commenter, only: [:create, :index]

  # load_and_authorize_resource
  respond_to :js, expect: [:update]
  respond_to :json, only: [:update]

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

  def update
    comment.update_attributes(content: params[:comment][:content])
    respond_with(comment)
  end

  def destroy
    @comments_count = comment.commentable.comments_count
    comment.destroy
    flash[:notice] = "таны бичсэн сэтгэгдэл амжилттай устгагдлаа."
    respond_with comment
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def commentable
      klass = COMMENTABLES.detect { |t| params["#{t.name.underscore}_id"] }
      @commentable ||= klass.find(params["#{klass.name.underscore}_id"])
    end

    def become_commenter
      current_user.extend Commenter
    end

    def comment
      @comment ||= current_user.comments.find(params[:id])
    end
    helper_method :comment
end

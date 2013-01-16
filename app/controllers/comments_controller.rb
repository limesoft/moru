# encoding: utf-8

class CommentsController < ApplicationController

  before_filter :become_commenter, only: [:create]

  # load_and_authorize_resource
  respond_to :js

  def create
    @comment = Comment.new(comment_params)
    current_user.create_comment @comment, params
    respond_with @comment
  rescue Exception => e
    puts '----------------- EXCEPTION'
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def become_commenter
      current_user.extend Commenter
    end
end

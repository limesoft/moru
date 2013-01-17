# encoding: utf-8

class PostsController < ApplicationController

  def index
  end

  def show
    @comments = post.comments.includes(:user).page(params[:page]).per(3)
    respond_with post
  end

  private
    def post
      @post ||= Post.find(params[:id])
    end
    helper_method :post
end

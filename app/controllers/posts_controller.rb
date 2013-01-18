# encoding: utf-8

class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @comments = post.comments.includes(:user).order("created_at DESC").page(params[:page]).per(3)
    respond_with post
  end

  private
    def post
      @post ||= Post.find(params[:id])
    end
    helper_method :post
end

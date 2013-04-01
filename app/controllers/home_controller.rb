# encoding: utf-8

class HomeController < ApplicationController

  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(1)
  end

end

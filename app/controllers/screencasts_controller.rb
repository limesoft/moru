# encoding: utf-8

class ScreencastsController < ApplicationController

  def index
    @screencasts = Screencast.recent.page(params[:page]).per(5)
    respond_with @screencasts
  end

  def show
    @comments = screencast.comments.includes(:user).order("created_at DESC").page(params[:page]).per(3)
    @recent_screencasts = Screencast.where("id NOT IN (?)", screencast.id).limit(3)
    respond_with screencast
  end

  private
    def screencast
      @screencast ||= Screencast.find(params[:id])
    end
    helper_method :screencast
end

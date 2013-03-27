# encoding: utf-8

class ScreencastsController < ApplicationController

  def index
    @screencasts = Screencast.recent.page(params[:page]).per(5)
    respond_with @screencasts
  end

  def show
    respond_with screencast
  end

  private
    def screencast
      @screencast ||= Screencast.find(params[:id])
    end
    helper_method :screencast
end

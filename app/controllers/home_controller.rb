# encoding: utf-8

class HomeController < ApplicationController

  def index
  end

  private
    def current_event
      @current_event ||= Event.last.extend GoingContext
    end
    helper_method :current_event

    def latest_post
      @latest_post ||= Post.last
    end
    helper_method :latest_post
end

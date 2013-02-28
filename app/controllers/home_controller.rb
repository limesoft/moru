# encoding: utf-8

class HomeController < ApplicationController

  def index
  end

  private
    def latest_post
      @latest_post ||= Post.last
    end
    helper_method :latest_post
end

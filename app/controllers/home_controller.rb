# encoding: utf-8

class HomeController < ApplicationController

  def index
  end

  private
    def current_event
      @current_event ||= Event.last
      @current_event.extend GoingContext
    end
    helper_method :current_event
end

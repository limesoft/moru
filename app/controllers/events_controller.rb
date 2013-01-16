# encoding: utf-8

class EventsController < ApplicationController

  # load_and_authorize_resource
  respond_to :js

  layout "events"

  def index
    @events = Event.order("created_at DESC").page(params[:page]).per(6)
    respond_with @events
  end

  def show
    @comments = event.comments.includes(:user).page(params[:page]).per(3)
    respond_with event, layout: "application"
  end

  private
    def event
      @event ||= Event.find(params[:id])
    end
    helper_method :event

end

# encoding: utf-8

class EventsController < ApplicationController

  # load_and_authorize_resource
  respond_to :js

  layout "events"

  def index
    @events = Event.order("created_at DESC").page(params[:page]).per(3)
    respond_with @events
  end

  def show
    respond_with event
  end

  private
    def event
      @event ||= Event.find(params[:id])
    end
    helper_method :event

end

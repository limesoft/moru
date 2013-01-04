# encoding: utf-8

class EventsController < ApplicationController

  # load_and_authorize_resource

  def index
    @events = Event.order("created_at DESC")
    respond_with @events
  end

  def show
    respond_with event
  end

  def new
    @event = Event.new
    respond_with @event
  end

  def create
    @event = Event.new(event_params)
    flash[:notice] = "\"#{@event.title}\" гарчигтай үйл явдал амжилттай зарлагдлаа." if @event.save
    respond_with @event
  end

  def edit
    respond_with event
  end

  def update
    flash[:notice] = "\"#{event.title}\" гарчигтай үйл явдал амжилттай шинэчлэгдлээ" if event.update_attributes(event_params)
    respond_with event
  end

  def destroy
    event.destroy
    flash[:notice] = "\"#{event.title}\" гарчигтай үйл явдал амжилттай устгагдлаа."
    respond_with event
  end

  private
    def event
      @event ||= Event.find(params[:id])
    end
    helper_method :event

    def event_params
      params.require(:event).permit(:title, :content, :latitude, :longitude)
    end
end

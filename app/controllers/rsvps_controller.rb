# encoding: utf-8

class RsvpsController < ApplicationController

  respond_to :js

  # load_and_authorize_resource

  def create
    # current_user-г RsvpContext-р өргөтгөж өгсөнөөр
    # уг хэрэглэгч RsvpContext-д зааж өгсөн чадваруудтай болно
    current_user.extend RsvpContext
    @rsvp = current_user.create_rsvp(event, rsvp_params[:going])

    # Уг event-г GoingContext-р өргөтгөж өгсөнөөр уг
    # event GoingContext-д зааж өгсөн чадваруудтай болно
    # Жишээ нь: count_rsvp, count_going гэх мэт
    event.extend GoingContext
    @counter = event.count_rsvp(rsvp_params[:going])
    respond_with @rsvp
  end

  private
    def event
      @event ||= Event.find(rsvp_params[:event_id])
    end

    def rsvp_params
      params.require(:rsvp).permit(:event_id, :going)
    end
end

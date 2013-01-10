# encoding: utf-8

class RsvpsController < ApplicationController

  respond_to :js

  # load_and_authorize_resource

  def create
    # 1. Эхлээд уг event-д rsvp өгсөн эсэхийг шалгана
    @rsvp = current_user.rsvp_for event
    if @rsvp.present? && @rsvp.going != going
      # 2. Өгсөн байх юм бол rsvp-г шинэчлэнэ
      @rsvp.going = going
      @rsvp.save
    else
      # 3. Өгөөгүй байх юм бол шинээр үүсгэнэ
      # current_user-г RsvpContext-р өргөтгөж өгсөнөөр
      # уг хэрэглэгч RsvpContext-д зааж өгсөн чадваруудтай болно
      current_user.extend RsvpContext
      @rsvp = current_user.create_rsvp(event, going)
    end

    # Уг event-г GoingContext-р өргөтгөж өгсөнөөр уг
    # event GoingContext-д зааж өгсөн чадваруудтай болно
    # Жишээ нь: count_rsvp, count_going гэх мэт
    event.extend GoingContext
    @counter = event.count_rsvp(going)
    respond_with @rsvp
  end

  private
    def event
      @event ||= Event.find(rsvp_params[:event_id])
    end

    def going
      @rsvp_going ||= rsvp_params[:going]
    end

    def rsvp_params
      params.require(:rsvp).permit(:event_id, :going)
    end

end

# encoding: utf-8

class RsvpsController < ApplicationController

  respond_to :js

  # load_and_authorize_resource

  def create
    # 1. Эхлээд уг event-д rsvp өгсөн эсэхийг шалгана
    @rsvp = current_user.rsvp_of current_event
    if @rsvp.present? && @rsvp.going != going
      # 2. Өгсөн байх юм бол rsvp-г шинэчлэнэ
      @rsvp.going = going
      @rsvp.save
    else
      # 3. Өгөөгүй байх юм бол шинээр үүсгэнэ
      # current_user-г RsvpContext-р өргөтгөж өгсөнөөр
      # уг хэрэглэгч RsvpContext-д зааж өгсөн чадваруудтай болно
      current_user.extend RsvpContext
      @rsvp = current_user.create_rsvp(current_event, going)
    end

    # Уг event-г GoingContext-р өргөтгөж өгсөнөөр уг
    # event GoingContext-д зааж өгсөн чадваруудтай болно
    # Жишээ нь: count_rsvp, count_going гэх мэт
    @counter = current_event.count_rsvp(going)
    respond_with @rsvp
  end

  private
    def current_event
      @event ||= Event.last.extend GoingContext
    end

    def going
      @rsvp_going ||= rsvp_params[:going]
    end

    def rsvp_params
      params.require(:rsvp).permit(:going)
    end

end

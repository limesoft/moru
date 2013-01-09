# encoding: utf-8

module RsvpContext

  def new_rsvp(event, going)
    rsvp_source.call.tap do |r|
      r.user = self
      r.event = event
      r.going = going
    end
  end

  def add_rsvp(rsvp)
    rsvp.save
  end

  def create_rsvp(event, going)
    add_rsvp(new_rsvp(event, going))
    rsvp_source
  end

  private
    def rsvp_source
      @rsvp_source ||= Rsvp.public_method :new
    end
end
